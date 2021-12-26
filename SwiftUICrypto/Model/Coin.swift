// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let coin = try? newJSONDecoder().decode(Coin.self, from: jsonData)

import Foundation

// MARK: - CoinElement
struct CoinElement: Codable, Identifiable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank: Int
    let fullyDilutedValuation: Int?
    let totalVolume, high24H, low24H, priceChange24H: Double?
    let priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H, circulatingSupply: Double?
    let totalSupply, maxSupply: Double?
    let ath, athChangePercentage: Double
    let athDate: String
    let atl, atlChangePercentage: Double
    let atlDate: String
    let roi: Roi?
    let lastUpdated: String
    let sparklineIn7D: SparklineIn7D
    let priceChangePercentage1HInCurrency: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case roi
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage1HInCurrency = "price_change_percentage_1h_in_currency"
    }
    
    var formattedPriceString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        let number = NSNumber(value: currentPrice)
        return formatter.string(from: number)!
    }
    
    func isFavorited(favorites: [CoinInfoEntity]) -> Bool {
        favorites.contains { coinInfoEntity in
            self.id == coinInfoEntity.coinID
        }
    }
    
}

// MARK: - Roi
struct Roi: Codable {
    let times: Double
    let currency: Currency
    let percentage: Double
}

enum Currency: String, Codable {
    case btc = "btc"
    case eth = "eth"
    case usd = "usd"
}

// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]
}

typealias Coins = [CoinElement]

struct MockData {
    
    static let sampleCoin = CoinElement(id: "bitcoin",
                                        symbol: "btc",
                                        name: "Bitcoin",
                                        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
                                        currentPrice: 56348,
                                        marketCap: 1065212905143,
                                        marketCapRank: 1,
                                        fullyDilutedValuation: 1184254882666,
                                        totalVolume: 40146944916,
                                        high24H: 58834,
                                        low24H: 55822,
                                        priceChange24H: -2485.878607331608,
                                        priceChangePercentage24H: -4.22525,
                                        marketCapChange24H: -47846813587.260864,
                                        marketCapChangePercentage24H: -4.29867,
                                        circulatingSupply: 18889068,
                                        totalSupply: 21000000,
                                        maxSupply: 21000000,
                                        ath: 69045,
                                        athChangePercentage: -18.21294,
                                        athDate: "2021-11-10T14:24:11.849Z",
                                        atl: 67.81,
                                        atlChangePercentage: 83177.5744,
                                        atlDate: "2013-07-06T00:00:00.000Z",
                                        roi: nil,
                                        lastUpdated: "2021-12-02T16:32:20.332Z",
                                        sparklineIn7D:
                                            SparklineIn7D(price: [
                                                57966.440774408744,
                                                58701.326649693,
                                                58523.701453143156,
                                                58649.39751171919,
                                                58960.47643122874,
                                                59080.20577796975,
                                                59206.23283719067,
                                                59105.20972766568,
                                                58970.45575702457,
                                                58966.09173564621,
                                                58802.35755839122,
                                                58958.54835174954,
                                                58897.84698299794,
                                                58752.988608631706,
                                                58526.65275968706,
                                                58422.387684545196,
                                                58037.07167439249,
                                                57798.41567323971,
                                                57822.43596883562,
                                                57522.59774064218,
                                                56946.52572719239,
                                                54311.7834211726,
                                                55084.24409740329,
                                                54657.9826454445,
                                                54031.99796233907,
                                                54331.54804957306,
                                                54581.36518505494,
                                                54780.33740390483,
                                                54461.120723750304,
                                                54416.83081144729,
                                                54452.692793203925,
                                                54308.68564042327,
                                                54440.35230342877,
                                                54737.66631796861,
                                                54309.35144431372,
                                                54185.035132238896,
                                                53827.792865034724,
                                                54256.01253242786,
                                                54281.03202644522,
                                                54561.497783184735,
                                                54448.91631659698,
                                                54611.93622296279,
                                                54493.71352974155,
                                                54361.48123197953,
                                                54582.26417037935,
                                                55158.48787940667,
                                                54777.30676788121,
                                                54964.10460145907,
                                                54662.55080513914,
                                                54877.28452030543,
                                                55225.94278116193,
                                                54872.41104769767,
                                                55034.31590320573,
                                                55137.819315492656,
                                                54929.74250598285,
                                                55120.14223458848,
                                                55042.321880499556,
                                                54302.52648363042,
                                                54673.357695460465,
                                                55017.85545386132,
                                                54706.458576843426,
                                                54913.79333923843,
                                                54289.27665216697,
                                                54351.407439750554,
                                                54147.35760596634,
                                                54030.22870781243,
                                                54360.791583415965,
                                                54615.102949612396,
                                                54618.35333490151,
                                                54358.192983986926,
                                                54351.38016513259,
                                                55075.74714587423,
                                                54538.76193098877,
                                                54443.950039486015,
                                                54280.35811993937,
                                                54369.14579236798,
                                                54539.17984829006,
                                                54157.22595978086,
                                                53917.31173974184,
                                                54125.632666010875,
                                                54813.35031834351,
                                                54956.84448226395,
                                                56303.970003446266,
                                                56262.55264026281,
                                                57237.66113709043,
                                                57672.40154526862,
                                                57644.95333199272,
                                                57428.287783484535,
                                                57342.4956831791,
                                                57406.11327203107,
                                                57431.55034825179,
                                                57460.989097637306,
                                                57587.40863377124,
                                                57300.118359027656,
                                                56639.66552691411,
                                                57202.46845749004,
                                                57006.77544044273,
                                                56977.89811119984,
                                                57449.09594212058,
                                                56963.957715221106,
                                                57148.62909802838,
                                                57466.545583280385,
                                                58661.388074148184,
                                                58778.0924486182,
                                                57922.438795418915,
                                                58238.01156994982,
                                                58298.74370446868,
                                                58132.109111220765,
                                                57848.77353712989,
                                                57673.01720358286,
                                                57264.75613411526,
                                                57383.99477205407,
                                                56914.92749035433,
                                                57085.760293706786,
                                                56454.03820834856,
                                                56542.0397393746,
                                                56523.26076275895,
                                                57087.53283811067,
                                                56743.35353392117,
                                                57245.48791673477,
                                                57803.98969654279,
                                                58004.560779011386,
                                                58287.480460405925,
                                                58245.023829509584,
                                                58037.06942067668,
                                                56900.66210911213,
                                                57561.18678702333,
                                                58168.83071808722,
                                                57571.73327214456,
                                                57477.67843998304,
                                                57140.30195637298,
                                                57284.79860083988,
                                                57011.28047424234,
                                                57667.274948479535,
                                                57122.659634431744,
                                                57483.820922728504,
                                                57365.336006058795,
                                                57153.80804847776,
                                                56825.20805296221,
                                                57034.263390372,
                                                57231.74115731497,
                                                56749.09809986786,
                                                57109.2741554903,
                                                56992.296117908314,
                                                57072.35800520041,
                                                57097.00469200236,
                                                57879.66895984179,
                                                58533.73546751175,
                                                58612.92011647459,
                                                58566.569446320806,
                                                58327.421094356454,
                                                57516.59176426094,
                                                57606.42665919249,
                                                56973.071441714164,
                                                57068.05895199137,
                                                57124.866357580555,
                                                57169.37199381056,
                                                56916.55089897206,
                                                57214.082150451875,
                                                57004.22208925368,
                                                56367.42957147236,
                                                56522.443308392365,
                                                56922.76114582327,
                                                56571.45952071818,
                                                56888.684247225356,
                                                57067.47418828491,
                                                56709.0773641982,
                                                56557.24685535338
                                            ]),
                                        priceChangePercentage1HInCurrency: -0.5500058750857266)
    
    static let sampleCoinInfo = CoinInfo(id: "Bitcoin",
                                         symbol: "btc",
                                         name: "Bitcoin",
                                         platforms: Platforms(empty: ""),
                                         blockTimeInMinutes: 10,
                                         hashingAlgorithm: "SHA-256",
                                         categories: ["Cryptocurrency"],
                                         publicNotice: nil,
                                         additionalNotices: [],
                                         coinInfoDescription: Description(en: "Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process. Bitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks. Bitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency."),
                                         links: Links(
                                            homepage: ["http://www.bitcoin.org"],
                                            blockchainSite: ["https://blockchair.com/bitcoin/", "https://btc.com/", "https://btc.tokenview.com/"],
                                            officialForumURL: ["https://bitcointalk.org/"],
                                            chatURL: [],
                                            announcementURL: [],
                                            twitterScreenName: "bitcoin",
                                            facebookUsername: "bitcoins",
                                            bitcointalkThreadIdentifier: nil,
                                            telegramChannelIdentifier: "",
                                            subredditURL: "https://www.reddit.com/r/Bitcoin/",
                                            reposURL: ReposURL(
                                                github: ["https://github.com/bitcoin/bitcoin", "https://github.com/bitcoin/bips"],
                                                bitbucket: [])),
                                         image: CoinInfoImage(
                                            thumb: "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579", small: "https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579", large: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579"),
                                         countryOrigin: "",
                                         genesisDate: "2009-01-03",
                                         sentimentVotesUpPercentage: 70.13,
                                         sentimentVotesDownPercentage: 29.87,
                                         marketCapRank: 1,
                                         coingeckoRank: 2,
                                         coingeckoScore: 80.366,
                                         developerScore: 98.876,
                                         communityScore: 70.897,
                                         liquidityScore: 100.247,
                                         publicInterestScore: 0,
                                         publicInterestStats: PublicInterestStats(alexaRank: 9440, bingMatches: nil),
                                         statusUpdates: [],
                                         lastUpdated: "2021-12-15T12:38:12.705Z")
    
}
