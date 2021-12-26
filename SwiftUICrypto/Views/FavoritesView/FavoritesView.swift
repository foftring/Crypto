//
//  FavoritesView.swift
//  SwiftUICrypto
//
//  Created by Frank Oftring on 12/5/21.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var favorites: FavoritesViewModel
    
    let testStack: [CoinInfo] = [
        MockData.sampleCoinInfo,
        MockData.sampleCoinInfo,
        MockData.sampleCoinInfo
    ]
    
    var body: some View {
        NavigationView {
            if favorites.favorites.isEmpty {
                EmptyFavoritesView()
            } else {
                GeometryReader { geo in
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        Spacer()
                        
                        HStack(spacing: 8) {
                            ForEach(favorites.favorites) { coinInfoEntity in
                                CoinCardView(coinInfo: coinInfoEntity)
                                    .padding()
                            }
                        }
                        .padding()
                        
                        Spacer()
                    }
                }
                //            .edgesIgnoringSafeArea(.all)
                .navigationTitle("My Favorites ➡️")
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    
    static var previews: some View {
        FavoritesView()
            .environmentObject(FavoritesViewModel())
    }
}


