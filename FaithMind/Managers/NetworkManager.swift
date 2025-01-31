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
    
    func getVerse(isDaily: Bool) async throws -> BibleVerse {
        
        let randEndpoint = isDaily ? getRandomDaily() : getRandom()
        
        let endpoint = baseURL + "\(randEndpoint)?translation=kjv"
        
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
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: Date())
        let seed = components.year! + components.month! + components.day!
        srand48(seed)
        
        
        let randomBook = bibleBooksWithChapters.keys.randomElement() ?? "Genesis"
        let maxChapters = bibleBooksWithChapters[randomBook] ?? 1
        let randomChapter = Int(drand48() * Double(maxChapters)) + 1
        let maxVerses = bibleVersesPerChapter[randomBook]?[randomChapter - 1] ?? 1
        let randomVerse = Int(drand48() * Double(maxVerses)) + 1
        
        return "\(randomBook) \(randomChapter):\(randomVerse)"
    }
    
    func getRandom() -> String {
        let randomBook = bibleBooksWithChapters.keys.randomElement() ?? "Genesis"
        let maxChapters = bibleBooksWithChapters[randomBook] ?? 1
        let randomChapter = Int.random(in: 1...maxChapters)
        let maxVerses = bibleVersesPerChapter[randomBook]?[randomChapter - 1] ?? 1
        let randomVerse = Int.random(in: 1...maxVerses)
        
        return "\(randomBook) \(randomChapter):\(randomVerse)"
    }
    
    
    
}
