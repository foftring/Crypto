//
//  CryptoTabView.swift
//  SwiftUICrypto
//
//  Created by Frank Oftring on 12/1/21.
//

import SwiftUI

struct CryptoTabView: View {
    
    var body: some View {
        TabView {
            CoinListView()
                .tabItem {
                    Label("All Coins", systemImage: "bitcoinsign.circle.fill")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star.circle.fill")
                }
        }
    }
}

struct CryptoTabView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoTabView()
    }
}
