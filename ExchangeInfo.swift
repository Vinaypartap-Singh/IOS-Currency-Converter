//
//  ExchangeInfo.swift
//  LOTRConverter17
//
//  Created by Vinay Sandhu on 2024-02-23.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image(.exBG).resizable().ignoresSafeArea().background(.brown)
            VStack {
                Text("Exchange Currency").font(.title).bold().multilineTextAlignment(.leading)
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:").padding().multilineTextAlignment(.leading).lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                Exchangerate(leftImage: .goldpiece, leftText: "1 Gold Piece", rightImage: .goldpenny, rightText: "4 Gold Pennies").padding()
                Exchangerate(leftImage: .goldpenny, leftText: "1 Gold Pennt", rightImage: .silverpiece, rightText: "4 Silver Pieces").padding()
                Exchangerate(leftImage: .silverpiece, leftText: "1 Silver Piece", rightImage: .silverpenny, rightText: "4 Silver Pennies").padding()
                Exchangerate(leftImage: .silverpenny, leftText: "1 Silver Penny", rightImage: .copperpenny, rightText: "100 Copper Pennies").padding()
                
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }.buttonStyle(.borderedProminent).tint(.brown)
            }
            
        }
    }
}

#Preview {
    ExchangeInfo()
}
