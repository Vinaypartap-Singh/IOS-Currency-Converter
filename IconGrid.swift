//
//  IconGrid.swift
//  LOTRConverter17
//
//  Created by Vinay Sandhu on 2024-02-24.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if self.currency == currency {
                    CurrencyIcon(currencyImage: currency.image, text: currency.name ).background(.brown).clipShape(RoundedRectangle(cornerRadius: 10)).shadow(color: .black, radius: 10).overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)).opacity(1)
                } else {
                    CurrencyIcon(currencyImage: currency.image, text: currency.name ).background(.brown).clipShape(RoundedRectangle(cornerRadius: 10)).onTapGesture(perform: {
                        self.currency = currency
                        print(currency)
                    })
                }
              
            }
        }
    }
}

#Preview {
    IconGrid(currency: .constant(.silverPenny))
}
