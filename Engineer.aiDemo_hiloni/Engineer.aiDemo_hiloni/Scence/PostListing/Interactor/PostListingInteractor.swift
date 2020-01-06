//
//  PostListingInteractor.swift
//  Engineer.aiDemo_hiloni
//
//  Created by PCQ177 on 06/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation

class PostListingInteractor {
    //MARK:- API Method -
    static func callPostListingAPI(page: Int,completionSuccess: @escaping ((Data)->()),failure: @escaping ((String)->())) {
        APIManager.callRequest(.getPost(page), completionSuccess: { (response) in
            completionSuccess(response)
        }) { (error) in
            failure(error)
        }
    }
}
