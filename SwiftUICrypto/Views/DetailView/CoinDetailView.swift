//
//  CoinDetailView.swift
//  SwiftUICrypto
//
//  Created by Frank Oftring on 12/2/21.
//

import SwiftUI

struct CoinDetailView: View {
    
    @EnvironmentObject var favorites: FavoritesViewModel
    let coin: CoinElement
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var buttonText: String {
        withAnimation {
            coin.isFavorited(favorites: favorites.favorites) ? "Added ✅" : "Add To Favorites"
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                CoinImageView(coin: coin)
                    .frame(width: 50, height: 50)
                Text(coin.currentPrice.formattedAsCurrencyWithTwoDecimalPlaces())
                    .font(.title)
                    .padding()
                Spacer()
                
                CRLineChartView(coin: coin)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    
                    Text("Overview")
                        .font(.title)
                    
                    Divider()
                    
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                        CoinStat(statName: "Market Cap", value: coin.marketCap.formattedAsCurrencyWithTwoDecimalPlaces())
                        CoinStat(statName: "24h High", value: coin.high24H?.formattedAsCurrencyWithTwoDecimalPlaces() ?? "0")
                        CoinStat(statName: "24h Price Change", value: String(format: "\(coin.priceChangePercentage24H ?? 0)%", "%.0f"))
                        CoinStat(statName: "Circulating Supply", value: "\(coin.circulatingSupply ?? 0)")
                    }
                    .padding()
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        if !coin.isFavorited(favorites: favorites.favorites) {
                            favorites.getCoinInfo(from: coin.id)
                            print(coin.name)
                            print("----")
                            print(coin.id)
                        }
                    } label: {
                        Text(buttonText)
                    }
                    
                }
            }
            .navigationTitle(coin.name)
        }
    }
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailView(coin: MockData.sampleCoin)
            .environmentObject(FavoritesViewModel())
    }
}

struct CoinStat: View {
    
    let statName: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(statName)
                .font(.callout)
            Text(value)
                .font(.caption)
                
        }
    }
}
