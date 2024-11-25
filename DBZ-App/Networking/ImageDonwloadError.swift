//
//  ImageDonwloadError.swift
//  DBZ-App
//
//  Created by Jhonatan Chavez on 25/11/24.
//
import UIKit

enum ImageDownloadError: Error {
    case invalidURL
    case noData
    case invalidImageData
}

class ImageDownloader {
    
    static let shared = ImageDownloader()
        
    func downloadImage(from urlString: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(ImageDownloadError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(ImageDownloadError.noData))
                return
            }
            
            guard let image = UIImage(data: data) else {
                completion(.failure(ImageDownloadError.invalidImageData))
                return
            }
            
            completion(.success(image))
        }
        
        task.resume()
    }
}
