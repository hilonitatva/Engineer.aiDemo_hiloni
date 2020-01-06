//
//  PostListingViewController.swift
//  Engineer.aiDemo_hiloni
//
//  Created by PCQ177 on 06/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import UIKit

class PostListingViewController: BaseViewController {

    //MARK:- Outlets  -
    @IBOutlet weak var postListingTableView: UITableView!
    @IBOutlet var tableFooterView: UIView!
    
    //MARK:- Variable -
    lazy var viewModal           : PostListingViewModal     = PostListingViewModal(viewController: self)
    lazy var viewNavigator       : PostListingViewNavigator = PostListingViewNavigator(viewController: self)
    var postListing              : Post?
    var hits                     : [Hits] = [Hits]()
    
    //MARK:- Controller Method -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareView()
    }
    
    //MARK:- Pull To Refresh -
    var refreshController: UIRefreshControl {
        let tempRefreshController = UIRefreshControl()
        tempRefreshController.attributedTitle = NSAttributedString(string: "pullTORefresh".localize)
        tempRefreshController.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        return tempRefreshController
    }
    
    //MARK:- Objectiove Method -
    @objc func refreshTableView() {
        viewModal.preparePostListingView()
    }
    
    //MARK:- View Method -
    private func prepareView() {
        viewModal.preparePostListingView()
        viewModal.prepareTableView()
    }

}
//MARK:- Table View Delegate & DataSource -
extension PostListingViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.registerAndGet(cell: PostListingTableViewCell.self)!
        postCell.hit = self.hits[indexPath.row]
        postCell.toggleSwitch = { (hits) in
            self.hits[indexPath.row] = hits
            self.viewModal.prepareNavigationBar()
        }
        return postCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (self.hits.count - 1) {
            viewModal.pagingTable()
        }
    }
    
}
