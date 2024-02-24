//
//  SelectCountry.swift
//  LOTRConverter17
//
//  Created by Vinay Sandhu on 2024-02-23.
//

import SwiftUI

struct SelectCountry: View {
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    
    
    
    var body: some View {
        
        
        
        
        ZStack {
            Image(.exBG).resizable().ignoresSafeArea().background(.brown)
            VStack {
                Text("Select the Currency You are Starting With").bold().padding(.vertical)
                IconGrid(currency: $leftCurrency)
                Text("Select the Currency You would like to convert to").bold().padding(.vertical)
                IconGrid(currency: $rightCurrency)
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }.buttonStyle(.borderedProminent).tint(.brown).padding()
                
            }.padding().multilineTextAlignment(.center)
            
        }
    }
}

#Preview {
    SelectCountry(leftCurrency: .constant(.copperPenny), rightCurrency: .constant(.silverPiece))
}
