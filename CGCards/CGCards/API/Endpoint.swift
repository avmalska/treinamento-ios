//
//  Endpoint.swift
//  CGCards
//
//  Created by Juan Andrey Valverde Malska on 09/08/22.
//

import Foundation

enum Endpoint {
    case metadata
    case cardSearch
    case cardDetail(id: Int)
    
    var url: String {
        switch self {
        case .metadata:
            return "metadata"
        case .cardSearch:
            return "cards"
        case .cardDetail(let id):
            return "cards/\(id)"
        }
        
    }
}

enum EndpointQuerys {
    case search
    case filters(pageNumber: Int, filterName: String, filterDetail: String)

    var query: [(String, String)] {
        switch self {
        case .search:
            return [
                ("locale", "en_US"), ("access_token", "EUaanLcoklBZ9hCyDKenW7pnnpHKMAZjEM")
            ]
        case .filters(let pageNumber, let filterName, let filterDetail):
            return [
                ("page", "\(pageNumber)"), (filterName, filterDetail)
            ]
        }
    }
}

