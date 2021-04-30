//
//  ResponseList.swift
//  PopCorn
//
//  Created by Valmir Torres on 29/10/19.
//  Copyright © 2019 Valmir Torres. All rights reserved.
//

import Foundation

struct ResponseList<T>: Decodable where T: Decodable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [T]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}
