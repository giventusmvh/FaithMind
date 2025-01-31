//
//  ContentView.swift
//  FaithMind
//
//  Created by Giventus Marco Victorio Handojo on 30/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            VerseView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Verse")
                }
                .toolbarBackgroundVisibility(.visible, for: .tabBar)
            
            FavoriteVerseView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorite Verses")
                }
                .toolbarBackgroundVisibility(.visible, for: .tabBar)
        }
    }
}

#Preview {
    ContentView()
}
