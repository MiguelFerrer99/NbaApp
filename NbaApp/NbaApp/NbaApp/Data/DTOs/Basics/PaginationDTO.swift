//
//  PaginationDTO.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import Foundation

struct PaginationDTO<T: Decodable>: Decodable {
    let data: [T]
    let meta: MetaDTO
    
    struct MetaDTO: Decodable {
        let current_page: Int
        let next_page: Int?
        let count: Int
        let total_pages: Int
        let total_count: Int
        
        enum CodingKeys: String, CodingKey {
            case current_page = "current_page"
            case next_page = "next_page"
            case count = "per_page"
            case total_pages = "total_pages"
            case total_count = "total_count"
        }
    }
}
