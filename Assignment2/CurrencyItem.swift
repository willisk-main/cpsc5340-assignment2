import SwiftUI

struct CurrencyItem: View {
    
    var card : ConvertModel<CurrencyItemModel>
    
    // view based on isFront or isBack
    var body: some View {
        if card.isFront  {
            FrontCurrencyItem(card: card.cardContent)
        } else {
            BackCurrencyItem(card: card.cardContent)
            
           }
        }
    }

// Preview
struct CurrencyItem_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyItem(card: ConvertModel(cardContent: CurrencyItemModel(currencyName: "", currencyCode: "", countryFlag: "", multiplier: 1)))
    }
}

struct FrontCurrencyItem: View {
    var card: CurrencyItemModel
    
    var body: some View {
        VStack {
            HStack {
                Text(card.countryFlag)
                    .foregroundColor(.black) // Set text color to black
                Spacer()
            }
            HStack {
                Spacer()
                Text(card.currencyCode)
                    .foregroundColor(.black) // Set text color to black
                    .font(.headline) // Adjust font size and style as needed
            }
        }
        .frame(width: 130, height: 130)
        .padding()
        .background(Color.green)
    }
}

struct BackCurrencyItem: View {
    var card: CurrencyItemModel
    
    var body: some View {
        VStack {
            HStack {
                Text(card.currencyName)
                    .foregroundColor(.black) // Set text color to black
                    .font(.headline) // Adjust font size and style as needed
                Spacer()
            }
            HStack {
                Spacer()
                Text(String(card.multiplier))
                    .foregroundColor(.black) // Set text color to black
                    .font(.caption) // Adjust font size and style as needed
            }
        }
        .frame(width: 130, height: 130)
        .padding()
        .background(Color.green)
    }
}


