//
//  APIManger.swift
//  Engineer.aiDemo_hiloni
//
//  Created by PCQ177 on 06/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation
import  Alamofire

class APIManager {
    static func callRequest(_ router: APIRouter,completionSuccess: @escaping((Data)->()),failure: @escaping((String)->())) {
        
        let header = ["Content-Type":"application/json"]
        let path = router.path
        let parameter = router.parameter
        let encoding : ParameterEncoding = URLEncoding.default
        
        Alamofire.request(path, method: router.method, parameters: parameter, encoding: encoding, headers: header).validate().responseData { (response) in
            switch response.result {
            case .success:
                completionSuccess(response.result.value ?? Data())
            case .failure:
                failure(response.error?.localizedDescription ?? "")
            }
        }
    }
}
