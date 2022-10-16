//
//  LinkView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 24/9/22.
//

import SwiftUI

// MARK: - Representable
struct LinkViewRepresentable {
    let title: String
    let color: Color
    let style: LayoutDirection
}

// MARK: - States
enum LinkViewState {
    case idle
    case didTap
}

// MARK: - Main view
struct LinkView: View {
    let representable: LinkViewRepresentable
    @Binding var state: LinkViewState
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                HStack {
                    Text(representable.title)
                        .foregroundColor(representable.color)
                        .font(.body)
                        .lineLimit(1)
                        .frame(alignment: .leading)
                    Spacer()
                    Image(systemName: representable.style == .leftToRight ? "arrow.right" : "arrow.left")
                        .resizable()
                        .frame(width: 22, height: 18, alignment: .trailing)
                        .foregroundColor(representable.color)
                }.environment(\.layoutDirection, representable.style)
                Divider()
                    .frame(height: 2)
                    .overlay(representable.color)
            }.contentShape(Rectangle())
            .onTapGesture { state = .didTap }
        }.padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

// MARK: - Canvas preview
struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView(representable: .init(
            title: "Title",
            color: .black,
            style: .leftToRight
        ), state: .constant(.idle))
        .previewLayout(.sizeThatFits)
    }
}
