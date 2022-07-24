//
//  Capsule.swift
//  Nospresso
//
//  Created by Juan Andrey Valverde Malska on 24/07/22.
//

import Foundation

struct Capsule: Codable {
    
    let id: Int
    let category: String
    let coffees: [CapsuleCoffee]
    
    enum CodingKeys: String, CodingKey {
        case id
        case category = "categoria"
        case coffees = "cafes"
    }
}
