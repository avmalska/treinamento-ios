//
//  Endpoint.swift
//  CGCards
//
//  Created by Juan Andrey Valverde Malska on 09/08/22.
//

import Foundation

enum Endpoint {
    case metadata
    
    var url: String {
        switch self {
        case .metadata:
            return "metadata"
        }
    }
}

enum EndpointQuerys {
    case search

    var query: [(String, String)] {
        switch self {
        case .search:
            return [
                ("locale", "en_US"), ("access_token", "EU3RUeaosa7z16XBa0Sgi1RG7OkzBvNaz9")
            ]
        }
    }
}
