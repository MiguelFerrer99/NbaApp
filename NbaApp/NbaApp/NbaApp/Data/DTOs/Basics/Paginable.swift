//
//  Paginable.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import Foundation

struct Paginable<T: Decodable>: Decodable {
    let data: [T]
    let meta: Meta
    
    struct Meta: Decodable {
        let currentPage: Int
        let nextPage: Int?
        let count: Int
        let totalPages: Int
        let totalCount: Int
        
        enum CodingKeys: String, CodingKey {
            case currentPage = "current_page"
            case nextPage = "next_page"
            case count = "per_page"
            case totalPages = "total_pages"
            case totalCount = "total_count"
        }
    }
}
