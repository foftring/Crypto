//
//  CoinCardView.swift
//  SwiftUICrypto
//
//  Created by Frank Oftring on 12/15/21.
//

import SwiftUI

struct CoinCardView: View {
    
    @State private var  isShowingFullDescription: Bool = false
    @EnvironmentObject var favorites: FavoritesViewModel
    
    //    let coinInfo: CoinInfo = MockData.sampleCoinInfo
    let coinInfo: CoinInfoEntity
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color(.secondarySystemBackground))
            
            VStack {
                
                CoinInfoEntityImageView(coinInfoEntity: coinInfo)
                    .frame(width: 50, height: 50)
                
                LinkStackWithCapsule(coinInfo: coinInfo)
                
                Text(coinInfo.coinDescription == "" ? "No Description Available" : coinInfo.coinDescription ?? "")
                
                Link(destination: URL(string: coinInfo.homepage ?? "https://google.com")!) {
                    Text("More")
                }
                .buttonStyle(.bordered)

                
            }
            .padding()
            
            
        }
        .background(Color(.systemBackground))
        .frame(width: 325, height: 525)
    }
}

//struct CoinCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinCardView()
//    }
//}

struct FavoriteActionButton: View {
    
    let imageName: String
    let color: Color
    let buttonDescription: String
    
    var body: some View {
        VStack {
            
            ZStack {
                Image(systemName: imageName)
                    .scaledToFit()
                    .foregroundColor(.white)
                    .padding()
                    .background(color)
                    .clipShape(Circle())
            }
            
            Text(buttonDescription)
                .font(.caption)
            
        }
    }
}

struct LinkStackWithCapsule: View {
    
    @EnvironmentObject var favorites: FavoritesViewModel
    let coinInfo: CoinInfoEntity
    
    var body: some View {
            HStack {
                
                Link(destination: URL(string: (coinInfo.blockchainSite ?? "https://apple.com"))!) {
                    Text("Explore Blockchain")
                }
                .buttonStyle(.bordered)
                .padding()
                
                Button("Remove Favorite", role: .destructive) {
                    favorites.delete(entity: coinInfo)
                }
                .buttonStyle(.bordered)
                .padding()
            }
            
    }
}
