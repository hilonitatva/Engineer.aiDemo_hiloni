//
//  BaseViewController.swift
//  Engineer.aiDemo_hiloni
//
//  Created by PCQ177 on 06/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    //MARK:- Controller Method -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Custom Method -
    func showAlert(message: String) {
        let alert = UIAlertController(title: "projectName".localize, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok".localize, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
