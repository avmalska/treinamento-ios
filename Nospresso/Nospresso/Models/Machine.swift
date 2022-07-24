//
//  Machine.swift
//  Nospresso
//
//  Created by Juan Andrey Valverde Malska on 24/07/22.
//

import Foundation

struct Machine: Codable {
    
    let id: Int
    let name: String
    let price: Int
    let description: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "nome"
        case price = "preco"
        case description = "descricao"
        case image = "imagem"
    }
    
}
