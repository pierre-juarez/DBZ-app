//
//  CharacterViewModel.swift
//  DBZ-App
//
//  Created by Jhonatan Chavez on 24/11/24.
//

class CharacterViewModel{
    
    private let repository: CharacterRemoteRepositoryProtocol

    init(repository: CharacterRemoteRepositoryProtocol = CharactersRemoteRepository()){
        self.repository = repository
    }
    
    // MARK: getCharacters DBZ
    
    func getCharacters(page: Int, limit: Int? = 10, completion: @escaping (Result<[CharacterModel], Error>) -> Void){
        repository.fetchCharacters(page: page, limit: limit, completion: completion)
    }
    
    // MARK: getCharacter By ID
    
    func getCharacterDetail(idCharacter: Int, completion: @escaping (Result<CharacterModel, Error>) -> Void){
        repository.fetchCharactersDetail(idCharacter: idCharacter, completion: completion)
    }
    
    
}
