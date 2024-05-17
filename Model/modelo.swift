//
//  modelo.swift
//  fantasyRole
//
//  Created by monscerrat gutierrez on 16/05/24.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fantasyRole = try? JSONDecoder().decode(FantasyRole.self, from: jsonData)

import Foundation

// MARK: - FantasyRole
struct FantasyRole: Codable {
    let brastlewark: [Brastlewark]

    enum CodingKeys: String, CodingKey {
        case brastlewark = "Brastlewark"
    }
}

// MARK: - Brastlewark
struct Brastlewark: Codable {
    let id: Int
    let name: String
    let thumbnail: String
    let age: Int
    let weight, height: Double
    let hairColor: String
    let professions: [Profession]
    let friends: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, thumbnail, age, weight, height
        case hairColor = "hair_color"
        case professions, friends
    }
}

enum HairColor: String, Codable {
    case black = "Black"
    case gray = "Gray"
    case green = "Green"
    case pink = "Pink"
    case red = "Red"
}

enum Profession: String, Codable {
    case baker = "Baker"
    case blacksmith = "Blacksmith"
    case brewer = "Brewer"
    case butcher = "Butcher"
    case carpenter = "Carpenter"
    case cook = "Cook"
    case farmer = "Farmer"
    case gemcutter = "Gemcutter"
    case leatherworker = "Leatherworker"
    case marbleCarver = "Marble Carver"
    case mason = "Mason"
    case mechanic = "Mechanic"
    case medic = "Medic"
    case metalworker = "Metalworker"
    case miner = "Miner"
    case potter = "Potter"
    case prospector = "Prospector"
    case sculptor = "Sculptor"
    case smelter = "Smelter"
    case stonecarver = "Stonecarver"
    case tailor = "Tailor"
    case taxInspector = "Tax inspector"
    case tinker = " Tinker"
    case woodcarver = "Woodcarver"
}
