//
//  PostListingViewModal.swift
//  Engineer.aiDemo_hiloni
//
//  Created by PCQ177 on 06/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation
import UIKit
import  SVProgressHUD

class PostListingViewModal {
    
    //MARK:- Variable -
    var viewController          : PostListingViewController!
    var hasMore                 : Bool = false
    var isLoading               : Bool = false
    var page                    : Int = 0
    lazy var pagingTable: (()->()) = {
        if self.viewController.hits.count < self.viewController.postListing?.nbHits ?? 0 && self.hasMore == true && self.isLoading == false {
            self.viewController.postListingTableView.tableFooterView = self.viewController.tableFooterView
            self.page += 1
            self.getPostListing()
        }
    }
    
    init(viewController: PostListingViewController) {
        self.viewController = viewController
    }
    
    //MARK:- Prepare Method -
    func preparePostListingView() {
        self.page = 0
        self.getPostListing()
        self.prepareNavigationBar()
    }
    
    func prepareTableView() {
        viewController.postListingTableView.refreshControl = viewController.refreshController
    }
    
    func prepareNavigationBar() {
        let selectedPost = self.viewController.hits.filter { (hit) -> Bool in
            return hit.isActive
        }
        if selectedPost.count == 0 {
            self.viewController.title = "noPostSelected".localize
        }else if selectedPost.count == 1 {
            self.viewController.title = "onePostSelected".localize
        }else {
            self.viewController.title = "\("multiplePostSelected".localize) \(selectedPost.count)"
        }
    }
    
    
    
    //MARK:- Call API -
    func getPostListing() {
        self.isLoading = true
        let showIndicator = viewController.hits.count > 0 ? false : true
        if showIndicator {
            SVProgressHUD.show()
        }
        PostListingInteractor.callPostListingAPI(page: page, completionSuccess: { (response) in
            self.viewController.postListing = try? JSONDecoder().decode(Post.self, from: response)
            if self.page == 0 {
                self.viewController.hits.removeAll()
            }
            self.viewController.hits.append(contentsOf: (self.viewController.postListing?.hits)!)
            self.hasMore = self.page < self.viewController.postListing?.nbPages ?? 0 ? true : false
            self.viewController.postListingTableView.reloadData()
            self.viewController.postListingTableView.refreshControl?.endRefreshing()
            self.viewController.postListingTableView.tableFooterView = nil
            self.isLoading = false
            self.prepareNavigationBar()
            SVProgressHUD.dismiss()
        }) { (error) in
            self.viewController.showAlert(message: error)
            SVProgressHUD.dismiss()

        }
    }
}
