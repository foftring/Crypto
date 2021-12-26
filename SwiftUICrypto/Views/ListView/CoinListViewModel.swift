//
//  CoinManager.swift
//  SwiftUICrypto
//
//  Created by Frank Oftring on 12/2/21.
//

import Foundation
import SwiftUI

@MainActor class CoinListViewModel: ObservableObject {
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var isShowingCoinDetailView: Bool = false
    
    @Published var coins: Coins = []
    @Published var selectedCoin: CoinElement? {
        didSet {
            isShowingCoinDetailView = true
        }
    }
    
    func getCoins() {
        
        Task {
            coins = try await NetworkManager.shared.fetchCoins()
        }
        
    }
    
    
    
    func getImages() {
        
        
    }
    
}
