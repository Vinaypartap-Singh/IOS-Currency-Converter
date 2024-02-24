//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Vinay Sandhu on 2024-02-23.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State var leftText = ""
    @State var rightText = ""
    @State var showExchangeInfo = false
    
    // Get Currency Data
    @State var leftCurrency: Currency = .copperPenny
    @State var rightCurrency: Currency = .silverPenny
    
    @State var showSelectCurrency = false
    
    // Focused State
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    var body: some View {
        ZStack {
            // for background image
            Image(.background).resizable().ignoresSafeArea()
            
            // VStack for Content
            VStack {
                // Logo Image
                Image(.logo).resizable().scaledToFit().frame(width: 150)
                
                // Text
                
                Text("Currency Converter").foregroundColor(.white).bold().font(.system(size: 28))
                
                // HStack
                HStack {
                    // VStack For Text and TextInput
                    VStack {
                        // HStack For Icon and Text in one Line
                        HStack {
                            Image(leftCurrency.image).resizable().scaledToFit().frame(width: 40)
                            Text(leftCurrency.name)
                                .foregroundColor(.white)
                        }.onTapGesture {
                            showSelectCurrency.toggle()
                        }.popoverTip(CurrencyTip(), arrowEdge: .bottom)
                        TextField("Amount", text: $leftText).textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .onChange(of: leftText, {
                                if leftTyping == true {
                                    rightText = leftCurrency.convert(amountString: leftText, currency: rightCurrency)
                                }
                            
                        })
                        // Text Input
                    }
                    // Equal Sign Image
                    Image(systemName: "equal").foregroundColor(.white).symbolEffect(.pulse)
                    // VStack
                    VStack {
                        // HStack For Icon and Text in one Line
                        HStack {
                            Image(rightCurrency.image).resizable().scaledToFit().frame(width: 40)
                            Text(rightCurrency.name)
                                .foregroundColor(.white)
                        }.onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        TextField("Amount", text: $rightText).textFieldStyle(.roundedBorder)
                            .focused($rightTyping)
                            .onChange(of: rightText, {
                                if rightTyping == true {
                                    leftText = rightCurrency.convert(amountString: rightText, currency: leftCurrency)
                                }
                            
                        })
                        // Text Input
                    }
                    
                }.padding().background(.black)
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill").foregroundColor(.white).font(.title)
                    }
                }
                .task {
                    try? Tips.configure()
                }
                .padding(.trailing)
                .sheet(isPresented: $showExchangeInfo) {
                    ExchangeInfo()
                }.sheet(isPresented: $showSelectCurrency, content: {
                    SelectCountry(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
