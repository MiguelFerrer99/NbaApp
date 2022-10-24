//
//  CustomAsyncImage.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 23/10/22.
//

import SwiftUI
import CachedAsyncImage

// MARK: - Representables
struct CustomAsyncImageRepresentable {
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
        CachedAsyncImage(url: URL(string: representable.urlString)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: representable.style == .big ? 150 : 40, height: representable.style == .big ? 150 : 40)
                    .clipShape(Circle())
            case .failure:
                let separaredFullname = representable.fullname.components(separatedBy: .whitespaces)
                let firstInitial = String(separaredFullname[0].first ?? Character(""))
                let secondInitial = String(separaredFullname[1].first ?? Character(""))
                Text(firstInitial + secondInitial)
                    .font(representable.style == .big ? .system(size: 60) : .subheadline)
                    .frame(width: representable.style == .big ? 150 : 40, height: representable.style == .big ? 150 : 40)
                    .background { Color.customGray.opacity(0.5) }
                    .clipShape(Circle())
            case .empty:
                Text("")
                    .frame(width: representable.style == .big ? 150 : 40, height: representable.style == .big ? 150 : 40)
                    .background { Color.customGray.opacity(0.5) }
                    .clipShape(Circle())
            @unknown default:
                Text("")
                    .frame(width: representable.style == .big ? 150 : 40, height: representable.style == .big ? 150 : 40)
                    .background { Color.customGray.opacity(0.5) }
                    .clipShape(Circle())
            }
        }
    }
}

// MARK: - Canvas preview
struct CustomAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomAsyncImage(representable: .init(
            fullname: "Stephen Curry",
            urlString: "https://nba-players.herokuapp.co/players/curry/stephen",
            style: .small
        )).previewLayout(.sizeThatFits)
    }
}
