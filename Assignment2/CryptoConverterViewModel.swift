import Foundation

class CryptoConverterViewModel: ObservableObject {
    
    struct Crypto {
        let cryptoName: String
        let cryptoLabel: String // The display name or label for the cryptocurrency
        let priceInUSD: Double
    }
    
    @Published var cryptos: [Crypto] = [
        Crypto(cryptoName: "Bitcoin", cryptoLabel: "US Dollar", priceInUSD: 35000),
        Crypto(cryptoName: "Ethereum", cryptoLabel: "Ethereum", priceInUSD: 1500),
        Crypto(cryptoName: "Tether", cryptoLabel: "Tether", priceInUSD: 1),
        Crypto(cryptoName: "BNB", cryptoLabel: "BNB", priceInUSD: 225),
        Crypto(cryptoName: "USD Coin", cryptoLabel: "USD Coin", priceInUSD: 1.00),
        Crypto(cryptoName: "XRP", cryptoLabel: "XRP", priceInUSD: 0.56),
    ]
    
    // function to take crypto amount & convert to $ USD
    func convertToUSD(cryptoName: Crypto, amount: Double) -> Double {
        return amount * cryptoName.priceInUSD
    }
}

