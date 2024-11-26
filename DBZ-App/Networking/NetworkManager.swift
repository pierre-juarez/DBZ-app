//
//  NetworkManager.swift
//  DBZ-App
//
//  Created by Jhonatan Chavez on 24/11/24.
//

import Foundation

enum NetworkError: Error{
    case invalidURL
    case noData
}

class NetworkManager{
    
    static let shared = NetworkManager()
    private let baseURL = "https://dragonball-api.com/api" // TODO: Environment
    
    func fetchData<T: Decodable>(endpoint: String, responseType: T.Type, completion: @escaping(Result<T, Error>) -> Void){
        
        guard let url = URL(string: "\(baseURL)\(endpoint)") else{
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        print("url", url)
        
        let task = URLSession.shared.dataTask(with: url){data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else{
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                print("Error falided decode: ", error)
                completion(.failure(error))
            }
            
        }
        
        task.resume()
        
    }
    
    
}
