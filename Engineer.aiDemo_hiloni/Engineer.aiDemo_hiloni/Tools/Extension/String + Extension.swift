//
//  String + Extension.swift
//  Engineer.aiDemo_hiloni
//
//  Created by PCQ177 on 06/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var localize: String {
        let locString = NSLocalizedString(self, comment: "")
        return locString
    }
}
