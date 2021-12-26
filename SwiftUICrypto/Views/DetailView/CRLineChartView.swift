//
//  LineChartView.swift
//  SwiftUICrypto
//
//  Created by Frank Oftring on 12/5/21.
//

import SwiftUI

struct CRLineChartView: View {
    
    let data: [Double]
    let maxY: Double
    let minY: Double
    let lineColor: Color
    //    let selectedIndex: IndexPath? = nil
    let startingDate: Date
    let endingDate: Date
    
    init(coin: CoinElement) {
        data = coin.sparklineIn7D.price
        maxY = data.max() ?? 0
        minY = data.min() ?? 0
        
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        lineColor = priceChange > 0 ? .green : .red
        
        endingDate = Date(coinGeckoString: coin.lastUpdated)
        startingDate = endingDate.addingTimeInterval(-7*24*60*60)
    }
    
    var body: some View {
        
        VStack {
            
            
            
            chartView
                .frame(height: 200)
                .background(chartBackground)
            .overlay(alignment: .leading) { chartYAxisLabels }
            
            HStack {
                Text(startingDate.asShortDateString())
                Spacer()
                Text(endingDate.asShortDateString())
            }
        }
        .font(.caption)
        .foregroundColor(.secondary)
        
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        CRLineChartView(coin: MockData.sampleCoin)
    }
}

extension CRLineChartView {
    
    private var chartView: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    
                    // X-Axis Increment
                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    
                    // Highest price minus lowest price
                    let yAxis = maxY - minY
                    
                    // Y-Axis position in relative terms multiplied by total height of the screen
                    let yPosition = (1 - (data[index] - minY) / yAxis) * geometry.size.height
                    
                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                }
            }
            .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
        }
    }
    
    private var chartBackground: some View {
        VStack {
            Divider()
            Spacer()
            Divider()
            Spacer()
            Divider()
        }
    }
    
    private var chartYAxisLabels: some View {
        VStack {
            Text(maxY.formattedAsCurrencyWithTwoDecimalPlaces())
            Spacer()
            Text(minY.formattedAsCurrencyWithTwoDecimalPlaces())
        }
    }
    
}
