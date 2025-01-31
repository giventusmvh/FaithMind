//
//  ViewModel.swift
//  FaithMind
//
//  Created by Giventus Marco Victorio Handojo on 31/01/25.
//

import Foundation

@Observable
@MainActor

class ViewModel {
    
    private(set) var status: fetchStatus = .notStarted
    
    var bibleVerse: BibleVerse = BibleVerse.defaultVerse()
    
    func getData() async {
        status = .fetching
        do {
            bibleVerse = try await NetworkManager.shared.getVerse()
            status = .success
        } catch {
            print("Error: \(error)")
            status = .failed(error: error)
        }
    }
    
    
}
