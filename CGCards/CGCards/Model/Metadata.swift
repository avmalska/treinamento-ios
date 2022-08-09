//
//  Metadata.swift
//  CGCards
//
//  Created by Juan Andrey Valverde Malska on 09/08/22.
//

import Foundation

// MARK: - Metadata
struct Metadata: Codable {
    let sets: [SetMeta]
    let setGroups: [SetGroup]
    let gameModes: [CardBackCategory]
    let arenaIDS: [Int]
    let types: [CardBackCategory]
    let rarities: [Rarity]
    let classes: [Class]
    let minionTypes, spellSchools, mercenaryRoles: [CardBackCategory]
    let keywords: [Keyword]
    let filterableFields, numericFields: [String]
    let cardBackCategories: [CardBackCategory]

    enum CodingKeys: String, CodingKey {
        case sets, setGroups, gameModes
        case arenaIDS = "arenaIds"
        case types, rarities, classes, minionTypes, spellSchools, mercenaryRoles, keywords, filterableFields, numericFields, cardBackCategories
    }
}

// MARK: - CardBackCategory
struct CardBackCategory: Codable {
    let slug: String
    let id: Int
    let name: String
    let gameModes: [Int]?
}

// MARK: - Class
struct Class: Codable {
    let slug: String
    let id: Int
    let name: String
    let cardID, heroPowerCardID: Int?
    let alternateHeroCardIDS: [Int]?

    enum CodingKeys: String, CodingKey {
        case slug, id, name
        case cardID = "cardId"
        case heroPowerCardID = "heroPowerCardId"
        case alternateHeroCardIDS = "alternateHeroCardIds"
    }
}

// MARK: - Keyword
struct Keyword: Codable {
    let id: Int
    let slug, name, refText, text: String
    let gameModes: [Int]
}

// MARK: - Rarity
struct Rarity: Codable {
    let slug: String
    let id: Int
    let craftingCost, dustValue: [Int?]
    let name: String
}

// MARK: - SetGroup
struct SetGroup: Codable {
    let slug: String
    let year: Int?
    let svg: String?
    let cardSets: [String]
    let name: String
    let standard: Bool?
    let icon, yearRange: String?
}

// MARK: - Set
struct SetMeta: Codable {
    let id: Int
    let name, slug: String
    let type: TypeEnum
    let collectibleCount, collectibleRevealedCount, nonCollectibleCount, nonCollectibleRevealedCount: Int
    let aliasSetIDS: [Int]?

    enum CodingKeys: String, CodingKey {
        case id, name, slug, type, collectibleCount, collectibleRevealedCount, nonCollectibleCount, nonCollectibleRevealedCount
        case aliasSetIDS = "aliasSetIds"
    }
}

enum TypeEnum: String, Codable {
    case adventure = "adventure"
    case base = "base"
    case empty = ""
    case expansion = "expansion"
}
