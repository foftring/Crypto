//
//  SwiftUICryptoApp.swift
//  SwiftUICrypto
//
//  Created by Frank Oftring on 12/1/21.
//

import SwiftUI

@main
struct SwiftUICryptoApp: App {
    
    @MainActor
    enum Globals {
        static let favorites = FavoritesViewModel()
    }
    
    var favorites = Globals.favorites
    
//    var favorites = FavoritesViewModel()
    
    var body: some Scene {
        WindowGroup {
            CryptoTabView()
                .environmentObject(favorites)
        }
    }
}
