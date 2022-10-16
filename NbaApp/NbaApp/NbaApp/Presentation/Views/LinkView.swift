//
//  LinkView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 24/9/22.
//

import SwiftUI

struct LinkView: View {
    let title: String
    let color: Color
    let style: LayoutDirection
    let dismiss: DismissAction?
    
    @Binding var isPressed: Bool
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                HStack {
                    Text(title)
                        .foregroundColor(color)
                        .font(.body)
                        .lineLimit(1)
                        .frame(alignment: .leading)
                    Spacer()
                    Image(systemName: style == .leftToRight ? "arrow.right" : "arrow.left")
                        .resizable()
                        .frame(width: 22, height: 18, alignment: .trailing)
                        .foregroundColor(color)
                }.environment(\.layoutDirection, style)
                Divider()
                    .frame(height: 2)
                    .overlay(color)
            }.contentShape(Rectangle())
            .onTapGesture {
                if let dismiss = dismiss { dismiss() }
                else { isPressed = true }
            }
        }.padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView(title: "Title", color: .black, style: .leftToRight, dismiss: nil, isPressed: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
