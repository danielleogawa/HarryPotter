//
//  Service.swift
//  HarryPotter
//
//  Created by Danielle Nozaki Ogawa on 2024/07/08.
//

import UIKit

enum NetworkError: Error {
    case invalidUrl
    case invalidData
}

struct Request {
    
    enum endpoint: String {
        case characters = "https://hp-api.onrender.com/api/characters"
    }
    
    static func request<T: Codable>(
        expecting: T.Type,
        urlString: String?
    ) async throws -> T {
        guard let urlString, let url = URL(string: urlString) else {
            throw NetworkError.invalidUrl
        }

        let request = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try decoder.decode(expecting, from: data)
        
        return result
    }
    
    static func downloadImage(
        from urlString: String?
    )  async throws -> UIImage? {
        guard let urlString, let url = URL(string: urlString) else {
            throw NetworkError.invalidUrl
        }
        let urlRequest = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        return UIImage(data: data)
    }
}
