//
//  PostListing.swift
//  Engineer.aiDemo_hiloni
//
//  Created by PCQ177 on 06/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation

struct Post : Codable {
    let hits : [Hits]?
    let nbHits : Int?
    let page : Int?
    let nbPages : Int?
    let hitsPerPage : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case hits = "hits"
        case nbHits = "nbHits"
        case page = "page"
        case nbPages = "nbPages"
        case hitsPerPage = "hitsPerPage"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        hits = try values.decodeIfPresent([Hits].self, forKey: .hits)
        nbHits = try values.decodeIfPresent(Int.self, forKey: .nbHits)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        nbPages = try values.decodeIfPresent(Int.self, forKey: .nbPages)
        hitsPerPage = try values.decodeIfPresent(Int.self, forKey: .hitsPerPage)
    }
    
}
struct Hits : Codable {
    let created_at : String?
    let title : String?
    var isActive : Bool = false
    
    enum CodingKeys: String, CodingKey {
        
        case created_at = "created_at"
        case title = "title"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
    
}
