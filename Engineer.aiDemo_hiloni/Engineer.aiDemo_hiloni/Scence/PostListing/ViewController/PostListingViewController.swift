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
    lazy var viewModal      : PostListingViewModal = PostListingViewModal(viewController: self)
    lazy var viewNavigator      : PostListingViewNavigator = PostListingViewNavigator(viewController: self)
    
    //MARK:- Controller Method -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareView()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- View Method -
    private func prepareView() {
        
    }

}
