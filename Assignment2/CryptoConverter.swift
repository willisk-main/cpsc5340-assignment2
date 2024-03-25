////
////  CryptoConverterView.swift
////  Assignment2
////
////  Created by Lauren Thompson on 10/25/23.
////
//
//// Lauren Thompson CPSC5340 October 2023
//
//
////
////  CryptoConverterView.swift
////  Assignment2
////
////  Created by Lauren Thompson on 10/25/23.
////
//
//// Lauren Thompson CPSC5340 October 2023
//
//
//import SwiftUI
//
//// CryptoConverView
//struct CryptoConverter: View {
//    
//    @StateObject var viewModel = CryptoConverterViewModel()
//    
//    @State private var selectedCryptoIndex = 0
//    
//    @State private var amount: String = ""
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            
//            //Picker("Select Cryptocurrency", selection: $selectedCryptoIndex) {
//            
//            //ForEach(0..<viewModel.cryptos.count) { index in
//            //  Text(viewModel.cryptos[index].cryptoName).tag(index)
//            
//            //ForEach(viewModel.cryptos.indices, id: \.self) { index in
//            //    Text(viewModel.cryptos[index].cryptoName).tag(index)
//            //}
//            //}
//            
//            //.pickerStyle(MenuPickerStyle())
//            
//            TextField("Enter amount", text: $amount)
//                .keyboardType(.decimalPad)
//                .padding()
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(8)
//            
//            // Convert button to perform the crypto conversion.
//            Button("Convert") {
//                
//                
//                let convertedAmount = viewModel.convertToUSD(cryptoName: viewModel.cryptos[selectedCryptoIndex], amount: Double(amount) ?? 0)
//                print("Equivalent in USD: \(convertedAmount)")
//            }
//            
//            
//            .padding()
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .cornerRadius(8)
//        }
//        
//        
//        .padding()
//    }
//}
//    
//    // Converter view preview
//struct CryptoConverter_Previews: PreviewProvider {
//    static var previews: some View {
//        CryptoConverter()
//    }
//}
//
