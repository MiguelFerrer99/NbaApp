//
//  CustomAsyncImage.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 23/10/22.
//

import SwiftUI

// MARK: - Representables
struct CustomAsyncImageRepresentable {
    let itemID: String
    let fullname: String
    let urlString: String
    let style: CustomAsyncImageStyle
    
    enum CustomAsyncImageStyle {
        case small
        case big
    }
}

struct CustomAsyncImage: View {
    // MARK: - Parameters
    let representable: CustomAsyncImageRepresentable
    
    // MARK: - Main view
    var body: some View {
        CachedAsyncImage(representable: .init(imageIdForCache: "playerImage_\(representable.itemID)", fullname: representable.fullname, urlString: representable.urlString)) {
            Circle()
                .frame(width: representable.style == .big ? 150 : 40, height: representable.style == .big ? 150 : 40)
                .background { Color.customGray.opacity(0.5) }
        } imageLoaded: {
            Image(uiImage: $0)
                .resizable()
                .scaledToFill()
                .frame(width: representable.style == .big ? 150 : 40, height: representable.style == .big ? 150 : 40)
                .background { Color.customGray.opacity(0.5) }
                .clipShape(Circle())
        }
    }
}

// MARK: - Canvas preview
struct CustomAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomAsyncImage(representable: .init(
            itemID: "ID",
            fullname: "Stephen Curry",
            urlString: "https://nba-players.herokuapp.co/players/curry/stephen",
            style: .small
        )).previewLayout(.sizeThatFits)
    }
}
