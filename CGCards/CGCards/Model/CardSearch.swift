//
//  CardSearch.swift
//  CGCards
//
//  Created by Juan Andrey Valverde Malska on 11/08/22.
//

import Foundation

// MARK: - CardSearch
struct CardSearch: Codable {
    let cards: [Card]
    let cardCount, pageCount, page: Int
}

// MARK: - Card
struct Card: Codable {
    let id, collectible: Int
    let slug: String
    let classID: Int
    let multiClassIDS: [Int]
    let cardTypeID, cardSetID, rarityID: Int
    let artistName: String
    let health, attack: Int?
    let manaCost: Int
    let name, text: String
    let image, imageGold: String
    let flavorText: String
    let cropImage: String?
    let childIDS, keywordIDS: [Int]?
    let duels: Duels?
    let minionTypeID, copyOfCardID, armor: Int?

    enum CodingKeys: String, CodingKey {
        case id, collectible, slug
        case classID = "classId"
        case multiClassIDS = "multiClassIds"
        case cardTypeID = "cardTypeId"
        case cardSetID = "cardSetId"
        case rarityID = "rarityId"
        case artistName, health, attack, manaCost, name, text, image, imageGold, flavorText, cropImage
        case childIDS = "childIds"
        case keywordIDS = "keywordIds"
        case duels
        case minionTypeID = "minionTypeId"
        case copyOfCardID = "copyOfCardId"
        case armor
    }
}

// MARK: - Duels
struct Duels: Codable {
    let relevant, constructed: Bool
}

