//
//  ContentView.swift
//  SwiftUICrypto
//
//  Created by Frank Oftring on 12/1/21.
//

import SwiftUI

struct CoinListView: View {
    
    @StateObject var viewModel = CoinListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(viewModel.coins) { coin in
                        VStack {
                            CoinNameAndImageStack(coin: coin)
                        }
                        .padding()
                        .onTapGesture {
                            viewModel.selectedCoin = coin
                        }
                    }
                }
                .onAppear {
                    viewModel.getCoins()
                    
                }
            }
            .sheet(isPresented: $viewModel.isShowingCoinDetailView) {
                CoinDetailView(coin: viewModel.selectedCoin!)
            }
            .navigationTitle("Available Coins")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}


