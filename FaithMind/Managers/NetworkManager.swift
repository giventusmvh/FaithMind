//
//  NetworkManager.swift
//  FaithMind
//
//  Created by Giventus Marco Victorio Handojo on 31/01/25.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL = "https://bible-api.com/"
    let decoder = JSONDecoder()
    
    func getVerse() async throws -> BibleVerse {
        
        let endpoint = baseURL + "Matthew 5:39?translation=kjv"
        
        guard let url = URL(string: endpoint) else {
            throw NetworkError.invalidURL
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do{
            return try decoder.decode(BibleVerse.self, from: data)
            
        }catch{
            throw NetworkError.decodingError
        }
    }
    
    func getRandomDaily() -> String {
        return ""
    }
    
    func getRandom() -> String {
        return ""
    }
    
    
    
}
