//
//  CapsuleCoffee.swift
//  Nospresso
//
//  Created by Juan Andrey Valverde Malska on 24/07/22.
//

import Foundation

struct CapsuleCoffee: Codable {
    
    let id: Int
    let name: String
    let description: String
    let intensity: Int?
    let price: Double
    let image: String
    let measures: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "nome"
        case description = "descricao"
        case intensity = "intensidade"
        case price = "precoUnitario"
        case image = "imagem"
        case measures = "medidas"
    }
}
