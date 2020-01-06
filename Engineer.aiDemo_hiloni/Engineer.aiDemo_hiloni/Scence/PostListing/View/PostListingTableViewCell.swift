//
//  PostListingTableViewCell.swift
//  Engineer.aiDemo_hiloni
//
//  Created by PCQ177 on 06/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import UIKit

class PostListingTableViewCell: UITableViewCell {

    //MARK:- Ouutlets -
    @IBOutlet private weak var postTitleLabel: UILabel!
    @IBOutlet private weak var postDateLabel: UILabel!
    @IBOutlet private weak var postActiveDeactiveSwitch: UISwitch!
    
    //MARK:- Variable -
    var hit: Hits? {
        didSet {
            self.postTitleLabel.text = hit?.title
            let createdDateFormat = DateFormatter()
            createdDateFormat.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSS'Z'"
            createdDateFormat.timeZone = .current
            if let recievedDate = createdDateFormat.date(from: (hit?.created_at)!) {
                createdDateFormat.dateFormat = "E,  d MMM yyyy hh:mm:ss a"
                self.postDateLabel.text = createdDateFormat.string(from: recievedDate)
            }
            self.postActiveDeactiveSwitch.isOn = hit?.isActive ?? false
        }
    }
    
    var toggleSwitch: ((Hits)->())?
    
    //MARK:- Action Method -
    @IBAction func didTapOnPostActiveDeactiveSwitch(_ sender: UISwitch) {
        self.hit?.isActive = !(self.hit?.isActive ?? false)
        self.toggleSwitch!(self.hit!)
    }
}
