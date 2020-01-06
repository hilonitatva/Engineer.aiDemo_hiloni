//
//  APIRouter.swift
//  Engineer.aiDemo_hiloni
//
//  Created by PCQ177 on 06/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation
import Alamofire

protocol Router {
    var path        : String { get }
    var method      : HTTPMethod { get }
    var parameter   : Parameters { get }
}

enum APIRouter: Router {
    
    case getPost(Int)
    
}
extension APIRouter {
    var path: String {
        switch self {
        case .getPost(let page):
            return Environment + "v1/search_by_date?tags=story&page=\(page)"
        }
    }
}
extension APIRouter {
    var method: HTTPMethod {
        switch self {
        case .getPost:
            return .get
        }
    }
}
extension APIRouter {
    var parameter: Parameters {
        switch self {
        case .getPost:
            return [:]
        }
    }
}
