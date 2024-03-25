import SwiftUI

struct CryptoItem: View {
    // StateObject holding view model for currency conversion
    @StateObject var viewModel: CryptoConverterViewModel = CryptoConverterViewModel()
    
    // User-entered amount for Bitcoin conversion
    @State private var amount: String = ""
    
    // State variable to control visibility of the keypad
    @State private var showKeypad: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // Input field and label for Bitcoin amount
                HStack {
                    // Label for input
                    Text("Bitcoin: ")
                    
                    // Input field
                    TextField("", text: $amount)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    
                        // Toggle keypad visibility
                        .onTapGesture {
                            self.showKeypad.toggle()
                        }
                }
                
                // List displaying results
                List(viewModel.cryptos.indices, id: \.self) { index in
                    HStack {
                        
                        // List label
                        Text(viewModel.cryptos[index].cryptoLabel)
                        Spacer()
                        
                        // Results displayed
                        // Default 1
                        if let amountDouble = Double(amount) {
                            Text(String(format: "%.1f", viewModel.convertToUSD(cryptoName: viewModel.cryptos[index], amount: amountDouble)))
                            
                        // Invalid Entry
                        } else {
                            Text("Invalid Entry")
                        }
                    }
                    
                    .frame(maxWidth: .infinity)
                }
            }
            
            .padding()
            
            // Screen Title
            .navigationBarTitle("Bitcoin Conversion", displayMode: .inline)
            
            // hide Keyboard
            .onTapBackgroundToDismissKeyboard()
            
            // show Keyboard
            if showKeypad {
                NumberPadView(value: $amount, showKeypad: $showKeypad)
                    .transition(.move(edge: .bottom))
            }
        }
    }
}

struct NumberPadView: View {
    @Binding var value: String
    @Binding var showKeypad: Bool

    // Define grid layout for buttons
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)

    var body: some View {
        VStack(spacing: 10) { // Adjust spacing between rows
            // Use LazyVGrid to layout the buttons in a grid
            LazyVGrid(columns: columns, spacing: 10) {
                // 1 to 9 buttons
                ForEach(1...9, id: \.self) { num in
                    NumberButton(num: num, action: {
                        value += "\(num)"
                    })
                }
                // Zero and backspace buttons
                NumberButton(num: 0, action: {
                    value += "0"
                })
                Button(action: {
                    if !value.isEmpty {
                        value.removeLast()
                    }
                }) {
                    Image(systemName: "delete.left")
                        .font(.largeTitle)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 44)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                Button(action: {
                    showKeypad = false
                }) {
                    Image(systemName: "return")
                        .font(.largeTitle)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 44)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white.opacity(0.5))
        .cornerRadius(20)
        .shadow(radius: 10)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 2)
        )
        .padding(.horizontal)
    }

    // Button template for numbers
    @ViewBuilder
    private func NumberButton(num: Int, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text("\(num)")
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 44)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
    }
}

// hideKeyboard
// resign the first responder status; dismisses the keyboard
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// onTap dismisses keyboard
// with tap -> resign the first responder status; dismisses the keyboard
struct TapBackgroundToDismissKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
}

// modified views
// easy if needs to be added in additional code location
extension View {
    func onTapBackgroundToDismissKeyboard() -> some View {
        self.modifier(TapBackgroundToDismissKeyboard())
    }
}

// Preview
struct CryptoItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CryptoItem()
        }
    }
}
