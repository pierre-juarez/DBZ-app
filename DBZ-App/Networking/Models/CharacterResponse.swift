//
//  CharacterResponse.swift
//  DBZ-App
//
//  Created by Jhonatan Chavez on 24/11/24.
//
import Foundation

struct CharacterResponse: Codable {
    let items: [CharacterDBZ]
}

// MARK: CharacterDBZ
struct CharacterDBZ: Codable {
    let id: Int
    let name, ki, maxKi, race, description, image: String

}

// MARK: CharacterDetail
struct CharacterDetail: Codable {
    let id: Int
    let name, ki, maxKi, race, description, image: String
    let originPlanet: OriginPlanet
    
    // Inicializador por defecto
    init(id: Int = 0, name: String = "", ki: String = "", maxKi: String = "", race: String = "", description: String = "", image: String = "", originPlanet: OriginPlanet = OriginPlanet(id: 0, name: "")) {
        self.id = id
        self.name = name
        self.ki = ki
        self.maxKi = maxKi
        self.race = race
        self.description = description
        self.image = image
        self.originPlanet = originPlanet
    }
}



struct OriginPlanet: Codable {
    let id: Int
    let name: String
}
