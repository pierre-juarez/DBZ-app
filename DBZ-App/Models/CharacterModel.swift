//
//  CharacterModel.swift
//  DBZ-App
//
//  Created by Jhonatan Chavez on 25/11/24.
//

import Foundation

struct CharacterModel{
    let id, ki, maxKi: Int
    let name, race, description, imgUrl: String
    let originalPlanet: OriginPlanet?
    
    init(from characterDBZ: CharacterDBZ){
        self.id = characterDBZ.id
        self.name = characterDBZ.name
        self.ki = Int(characterDBZ.ki) ?? 0
        self.maxKi = Int(characterDBZ.maxKi) ?? 0
        self.race = characterDBZ.race
        self.description = characterDBZ.description
        self.imgUrl = characterDBZ.image
        self.originalPlanet = nil
    }
    
    init(from characterDetail: CharacterDetail){
        self.id = characterDetail.id
        self.name = characterDetail.name
        self.ki = Int(characterDetail.ki) ?? 0
        self.maxKi = Int(characterDetail.maxKi) ?? 0
        self.race = characterDetail.race
        self.description = characterDetail.description
        self.imgUrl = characterDetail.image
        self.originalPlanet = characterDetail.originPlanet
    }
}
