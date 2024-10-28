//
//  ApiService.swift
//  Concurrency App
//
//  Created by shopnil hasan on 28/10/24.
//
import Foundation

struct ApiService  {
    let urlString: String
    
    func getJson<T: Decodable>(dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                               keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
                               completion: @escaping (Result<T, ApiError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard error == nil else {
                completion(.failure(.decodingError))
                return
            }
            
            guard let data else {
                completion(.failure(.corruptData))
                return
            }

            do {
                let users = try JSONDecoder().decode(T.self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}


enum ApiError: Error {
    case invalidURL, invalidResponse, corruptData, decodingError
}
