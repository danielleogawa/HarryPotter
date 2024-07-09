//
//  Characters.swift
//  HarryPotter
//
//  Created by Danielle Nozaki Ogawa on 2024/07/08.
//

import Foundation

struct Characters: Codable {
    let id: String?
    let name: String?
    let alternativeNames: [String]?
    let species: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let yearOfBirth: Double?
    let wizard: Bool?
    let ancestry: String?
    let eyeColour: String?
    let hairColour: String?
    let wand: Wand?
    let patronus: String?
    let hogwartsStudent: Bool?
    let hogwartsStaff: Bool?
    let actor: String?
    let alternateActors: [String]?
    let alive: Bool?
    let image: String?
}

struct Wand: Codable {
    let wood: String?
    let core: String?
    let length: Double?
}
