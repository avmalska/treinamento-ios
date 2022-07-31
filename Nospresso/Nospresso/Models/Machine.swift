//
//  Machine.swift
//  Nospresso
//
//  Created by Treinamento on 29/07/22.
//

import Foundation

struct Machine: Codable {
    
    let id: Int
    let name: String
    let price: Double
    let description: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case price = "preco"
        case description = "descricao"
        case image = "imagem"
    }
    
}
