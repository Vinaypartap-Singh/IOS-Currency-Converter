//
//  Exchangerate.swift
//  LOTRConverter17
//
//  Created by Vinay Sandhu on 2024-02-23.
//

import SwiftUI

struct Exchangerate: View {
    let leftImage: ImageResource
    let leftText: String
    let rightImage: ImageResource
    let rightText: String
    var body: some View {
        HStack {
            Image(leftImage).resizable().scaledToFit().frame(width: 40)
            Text(leftText)
            Image(systemName: "equal").symbolEffect(.pulse)
            Text(rightText)
            Image(rightImage).resizable().scaledToFit().frame(width: 40)
            
        }
    }
}

#Preview {
    Exchangerate(leftImage: .goldpiece, leftText: "1 Gold Piece", rightImage: .goldpenny, rightText: "4 Gold Penny")
}
