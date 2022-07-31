//
//  RepositorySearch.swift
//  GithubRepositories
//
//  Created by Juan Andrey Valverde Malska on 31/07/22.
//

import Foundation

struct RepositorySearch: Decodable {
    let totalCount: Int
    let incompleteResults: Bool
    let repositories: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case repositories = "items"
    }
    
}
