//
//  Double+Ext.swift
//  SwiftUICrypto
//
//  Created by Frank Oftring on 12/2/21.
//

import Foundation

extension Double {
    
    func formattedAsCurrencyWithTwoDecimalPlaces() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        let number = NSNumber(value: self)
        return formatter.string(from: number)!
    }
    
}


extension Int {
    
    func formattedAsCurrencyWithTwoDecimalPlaces() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        let number = NSNumber(value: self)
        return formatter.string(from: number)!
    }
    
}
