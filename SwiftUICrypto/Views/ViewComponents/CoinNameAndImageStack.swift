//
//  CoinNameAndImageStack.swift
//  SwiftUICrypto
//
//  Created by Frank Oftring on 12/23/21.
//

import SwiftUI

struct CoinNameAndImageStack: View {
    
    let coin: CoinElement
    
    var body: some View {
        CoinImageView(coin: coin)
            .frame(width: 75, height: 75)
        Text(coin.name)
    }
    
    
}

struct CoinNameAndImageStack_Previews: PreviewProvider {
    static var previews: some View {
        CoinNameAndImageStack(coin: MockData.sampleCoin)
    }
}
