//
//  PlayerCardView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

struct PlayerCardView: View {
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
        .listRowSeparator(.hidden)
        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

struct PlayerCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCardView(title: "Title", isPressed: .constant(false))
    }
}
