//
//  EmptyFavoritesView.swift
//  SwiftUICrypto
//
//  Created by Frank Oftring on 12/25/21.
//

import SwiftUI

struct EmptyFavoritesView: View {
    var body: some View {
        VStack {
            
            Text("No Coins Yet? Add One from the coins tab.")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Image("empty-state-transparent")
                .resizable()
                .frame(width: 350, height: 350)
                .offset(x: 75, y: 100)
        }
    }
}

struct EmptyFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyFavoritesView()
    }
}
