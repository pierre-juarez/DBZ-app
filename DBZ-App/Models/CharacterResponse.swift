//
//  CharacterResponse.swift
//  DBZ-App
//
//  Created by Jhonatan Chavez on 24/11/24.
//
import Foundation

struct CharacterResponse: Codable {
    let items: [CharacterDBZ]
    let meta: Meta
    let links: Links
}

struct CharacterDBZ: Codable {
    let id: Int
    let name: String
    let ki: String
    let maxKi: String
    let race: String
    let gender: String
    let description: String
    let image: String
    let affiliation: String
    let deletedAt: String?
}


struct Meta: Codable {
    let totalItems: Int
    let itemCount: Int
    let itemsPerPage: Int
    let totalPages: Int
    let currentPage: Int
}

struct Links: Codable {
    let first: String
    let previous: String?
    let next: String
    let last: String
}
