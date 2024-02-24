//
//  CurrencyIcon.swift
//  LOTRConverter17
//
//  Created by Vinay Sandhu on 2024-02-23.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyImage: ImageResource
    let text: String
    var body: some View {
        VStack {
            Image(currencyImage).resizable().scaledToFit().frame(maxWidth: .infinity)
            Text(text).bold().font(.system(size: 13))
        }.frame(width: 80, height: 80).padding([.vertical, .horizontal], 10)
    }
}

#Preview {
    CurrencyIcon(currencyImage: .silverpenny, text: "Silver Penny")
}
