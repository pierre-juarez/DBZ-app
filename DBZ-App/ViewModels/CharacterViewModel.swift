//
//  CharacterViewModel.swift
//  DBZ-App
//
//  Created by Jhonatan Chavez on 24/11/24.
//

class CharacterViewModel{
    
    private let networkManager = NetworkManager.shared
    var characters = [CharacterDBZ]()
    var characterDetail = CharacterDetail()
    
    // MARK: getCharacters DBZ
    
    func getCharacters(page: Int, limit: Int? = 10, completion: @escaping (Result<[CharacterDBZ], Error>) -> Void){
        networkManager.fetchData(endpoint: "/characters?page=\(page)&limit=\(limit ?? 10)", responseType: CharacterResponse.self) { result in
            switch result{
            case .success(let response):
                completion(.success(response.items))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // MARK: getCharacter By ID

    func getCharacterDetail(idCharacter: Int, completion: @escaping (Result<CharacterDetail, Error>) -> Void){
        networkManager.fetchData(endpoint: "/characters/\(idCharacter)", responseType: CharacterDetail.self) { result in
            switch result{
            case .success(let character):
                self.characterDetail = character
                completion(.success(character))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
