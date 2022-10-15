//
//  TeamCard.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 15/10/22.
//

import SwiftUI

struct TeamCard: View {
    let title: String
    @Binding var isPressed: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            Circle()
                .foregroundColor(.customGray)
                .frame(width: 40, height: 40)
                .padding(.horizontal)
            Text(verbatim: title)
                .lineLimit(1)
                .font(.headline)
                .bold()
                .padding(.trailing)
            Spacer()
        }.padding(.vertical)
        .background { Color.customLightGray }
        .cornerRadius(10)
        .shadow(color: .customGray, radius: 3, x: 0, y: 4)
        .onTapGesture { isPressed = true }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

struct TeamCard_Previews: PreviewProvider {
    static var previews: some View {
        TeamCard(title: "Title", isPressed: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
