//
//  Favorite.swift
//  SwiftUICrypto
//
//  Created by Frank Oftring on 12/5/21.
//

import Foundation
import CoreData
import SwiftUI


@MainActor final class FavoritesViewModel: ObservableObject {
    
    private let container: NSPersistentContainer
    private let containerName: String = "CoinInfoDM"
    private let entityName: String = "CoinInfoEntity"
    
    @Published var favorites: [CoinInfoEntity] = []
    
    init() {
        
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.getFavorites()
            }
        }
        
    }
    
    func getFavorites() {
        
        let request = NSFetchRequest<CoinInfoEntity>(entityName: entityName)
        
        do {
            self.favorites = try container.viewContext.fetch(request)
            
        } catch {
            print("Error fetching")
        }
    }
    
    func add(coinInfo: CoinInfo) {
        let newEntity = CoinInfoEntity(context: container.viewContext)
        newEntity.blockchainSite = coinInfo.links?.blockchainSite?.first
        newEntity.genesisDate = coinInfo.genesisDate
        newEntity.homepage = coinInfo.links?.homepage?.first
        newEntity.coinID = coinInfo.id
        newEntity.name = coinInfo.name
        newEntity.image = coinInfo.image?.large
        newEntity.blockTime = Int16(coinInfo.blockTimeInMinutes ?? 0)
        newEntity.coinDescription = coinInfo.coinInfoDescription?.en
        newEntity.hashingAlgorithm = coinInfo.hashingAlgorithm
        newEntity.reddit = coinInfo.links?.subredditURL
        newEntity.officialForum = coinInfo.links?.officialForumURL?.first
        newEntity.twitter = coinInfo.links?.twitterScreenName
        
        favorites.append(newEntity)
        updateCoins()
    }
    
    func delete(entity: CoinInfoEntity)  {
        container.viewContext.delete(entity)
        updateCoins()
    }
    
    func save() {
        do {
            try container.viewContext.save()
        } catch {
            print("Error saving to core data: \(error)")
        }
    }
    
    func updateCoins() {
        withAnimation {
            save()
            getFavorites()            
        }
    }
    
    func getCoinInfo(from coinID: String) {
        Task {
            do {
                let coinInfo = try await NetworkManager.shared.getInfoForFavorite(coinID: coinID)
                add(coinInfo: coinInfo)
            } catch {
                
            }
        }
    }
    
}
