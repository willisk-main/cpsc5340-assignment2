import Foundation

struct CryptoConvertModel<SomeType> : Identifiable  {
    let id = UUID()
    var name: String
    var priceInUSD: Double
}

// Crypto
struct Crypto {
    let cryptoName: String
    let priceInUSD: Double
}
