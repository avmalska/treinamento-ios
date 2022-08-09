//
//  APISupport.swift
//  CGCards
//
//  Created by Juan Andrey Valverde Malska on 09/08/22.
//

import Foundation

enum APIError: Error {
    case badUrl(string: String)
    case requestFailed(error: Error)
    case invalidData
    case decodeFailed(error: Error, textData: String?)
}

enum HTTPMethod: String {
    case post
    case `get`
    case delete
}

extension URL {
    mutating func append(_ queryItem: String, value: String?) {
        guard var urlComponents = URLComponents(string: absoluteString) else { return }

        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []

        // Create query item
        let queryItem = URLQueryItem(name: queryItem, value: value)

        // Append the new query item in the existing query items array
        queryItems.append(queryItem)

        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems

        // Returns the url from new url components
        self = urlComponents.url!
    }
}
