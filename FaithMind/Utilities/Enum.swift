//
//  Enum.swift
//  FaithMind
//
//  Created by Giventus Marco Victorio Handojo on 31/01/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

enum fetchStatus{
    case notStarted
    case fetching
    case success
    case failed(error:Error)
}
