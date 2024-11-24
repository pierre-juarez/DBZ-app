//
//  CharacterDetail.swift
//  DBZ-App
//
//  Created by Jhonatan Chavez on 24/11/24.
//

import Foundation

// MARK: - CharacterDetail
struct CharacterDetail: Codable {
    let id: Int
    let name, ki, maxKi, race: String
    let gender, description: String
    let image: String
    let affiliation: String
    let deletedAt: String?
    let originPlanet: OriginPlanet
    let transformations: [Transformation]
    
    // Inicializador por defecto
    init(id: Int = 0, name: String = "", ki: String = "", maxKi: String = "", race: String = "", gender: String = "", description: String = "", image: String = "", affiliation: String = "", deletedAt: String? = nil, originPlanet: OriginPlanet = OriginPlanet(id: 0, name: "", isDestroyed: false, description: "", image: "", deletedAt: nil), transformations: [Transformation] = []) {
        self.id = id
        self.name = name
        self.ki = ki
        self.maxKi = maxKi
        self.race = race
        self.gender = gender
        self.description = description
        self.image = image
        self.affiliation = affiliation
        self.deletedAt = deletedAt
        self.originPlanet = originPlanet
        self.transformations = transformations
    }
}


// MARK: - OriginPlanet
struct OriginPlanet: Codable {
    let id: Int
    let name: String
    let isDestroyed: Bool
    let description: String
    let image: String
    let deletedAt: String?
}

// MARK: - Transformation
struct Transformation: Codable {
    let id: Int
    let name: String
    let image: String
    let ki: String
    let deletedAt: String?
}

