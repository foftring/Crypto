//
//  CoinImageView.swift
//  SwiftUICrypto
//
//  Created by Frank Oftring on 12/3/21.
//

import SwiftUI
import Foundation

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func getImage(for urlString: String) {
        NetworkManager.shared.downloadImages(urlString: urlString) { returnedUIImage in
            guard let returnedUIImage = returnedUIImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: returnedUIImage)
            }
        }
    }
    
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("coin-placeholder-image").resizable()
    }
    
}

struct CoinImageView: View {
    
    let coin: CoinElement
    @StateObject var imageLoader = ImageLoader()

    var body: some View {
        RemoteImage(image: imageLoader.image)
        .onAppear {
            imageLoader.getImage(for: coin.image)
        }
    }

}

struct CoinInfoEntityImageView: View {
    
    let coinInfoEntity: CoinInfoEntity
    @StateObject var imageLoader = ImageLoader()
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                if let imageString = coinInfoEntity.image {
                    imageLoader.getImage(for: imageString)
                }
            }
    }
}

struct CoinInfoImageView: View {
    
    let coinInfo: CoinInfo
    @StateObject var imageLoader = ImageLoader()
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.getImage(for: coinInfo.image?.large ?? "")
            }
    }
    
}

struct CoinImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        CoinImageView(coin: MockData.sampleCoin)
    }
}

struct CoinInfoImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        CoinInfoImageView(coinInfo: MockData.sampleCoinInfo)
    }
}
