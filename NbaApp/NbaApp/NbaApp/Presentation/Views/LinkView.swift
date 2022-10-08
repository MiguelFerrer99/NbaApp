//
//  LinkView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 24/9/22.
//

import SwiftUI

struct LinkView: View {
    let title: String
    @Binding var isPressed: Bool
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                HStack {
                    Text(title)
                        .foregroundColor(.black)
                        .font(.body)
                        .lineLimit(1)
                        .frame(alignment: .leading)
                    Spacer()
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 22, height: 18, alignment: .trailing)
                        .foregroundColor(.black)
                }
                Divider()
                    .frame(height: 2)
                    .overlay(.black)
            }.contentShape(Rectangle())
            .onTapGesture { isPressed = true }
        }.padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView(title: "Title", isPressed: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
