//
//  NetowrkManager.swift
//  SwiftUICrypto
//
//  Created by Frank Oftring on 12/2/21.
//

import SwiftUI

final class NetworkManager: ObservableObject {
    
    static let shared = NetworkManager()
    
    private let cache = NSCache<NSString, UIImage>()
    
    let baseURLString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=1h%2C%2024%2C%207d"
    
    private init() { }
    
    func fetchCoins() async throws -> Coins {
        
        guard let url = URL(string: baseURLString) else {
            print("BAD URL")
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decodedCoins = try JSONDecoder().decode(Coins.self, from: data)
            return decodedCoins
        } catch  {
            print("ERROR DECODING")
            print("-----")
            print(error)
            throw URLError(.cannotDecodeContentData)
        }
        
    }
    
    func downloadImages(urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            
        }
        task.resume()
    }
    
    func getInfoForFavorite(coinID: String) async throws -> CoinInfo {
        let urlString = "https://api.coingecko.com/api/v3/coins/\(coinID)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decodedCoinInfo = try JSONDecoder().decode(CoinInfo.self, from: data)
            return decodedCoinInfo
        } catch {
            print("ERROR DECODING")
            print("-----")
            print(error)
            throw URLError(.cannotDecodeContentData)
        }
    }
    
//    func getCoinFromEntity(coinEntity: CoinInfoEntity) async throws -> CoinElement {
//        
//    }
    
}
