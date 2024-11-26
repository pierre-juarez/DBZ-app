//
//  CharactersRemoteRepository.swift
//  DBZ-App
//
//  Created by Jhonatan Chavez on 25/11/24.
//
// ViewModel y NetworkManager => CharactersRemoteRepository, para instanciar
protocol CharacterRemoteRepositoryProtocol{
    func fetchCharacters(page: Int, limit: Int?, completion: @escaping (Result<[CharacterModel], Error>) -> Void)
    func fetchCharactersDetail(idCharacter: Int, completion:  @escaping (Result<CharacterModel, Error>) -> Void)
}

class CharactersRemoteRepository: CharacterRemoteRepositoryProtocol{
    
    private let networkManager = NetworkManager.shared
    
    func fetchCharacters(page: Int, limit: Int?, completion: @escaping (Result<[CharacterModel], any Error>) -> Void) {
        let endpoint = "/characters?page=\(page)&limit=\(limit ?? 10)"
        networkManager.fetchData(endpoint: endpoint, responseType: CharacterResponse.self) { result in
            switch result {
            case .success(let response):
                let charactersModel = response.items.map{ CharacterModel(from: $0) }
                completion(.success(charactersModel))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchCharactersDetail(idCharacter: Int, completion: @escaping (Result<CharacterModel, any Error>) -> Void) {
        let endpoint = "/characters/\(idCharacter)"
        networkManager.fetchData(endpoint: endpoint, responseType: CharacterDetail.self) { result in
            switch result {
            case .success(let characterDetail):
                let characterDetailModel = CharacterModel(from: characterDetail)
                completion(.success(characterDetailModel))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    
}
