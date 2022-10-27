//
//  CachedAsyncImage.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 27/10/22.
//

import UIKit
import SwiftUI
import LetterAvatarKit

// MARK: - Representables
struct CachedAsyncImageRepresentable {
    let imageIdForCache: String
    let fullname: String
    let urlString: String
}

struct CachedAsyncImage<Placeholder: View, ImageLoaded: View>: View {
    // MARK: - Parameters
    @StateObject private var imageLoader: CachedAsyncImageLoader
    private let representable: CachedAsyncImageRepresentable
    private let placeholder: Placeholder
    private let imageLoaded: (UIImage) -> ImageLoaded
    
    // MARK: - Init
    init(representable: CachedAsyncImageRepresentable, @ViewBuilder placeholder: () -> Placeholder, @ViewBuilder imageLoaded: @escaping (UIImage) -> ImageLoaded) {
        self.representable = representable
        self.placeholder = placeholder()
        self.imageLoaded = imageLoaded
        self._imageLoader = StateObject(wrappedValue: CachedAsyncImageLoader(
            imageIdForCache: representable.imageIdForCache,
            fullname: representable.fullname,
            urlString: representable.urlString))
    }
    
    // MARK: - Main view
    var body: some View {
        content
            .onLoad { imageLoader.load() }
    }
    
    private var content: some View {
        Group {
            if imageLoader.isLoading {
                placeholder
            } else {
                imageLoaded(imageLoader.getImage())
            }
        }
    }
}

// MARK: - Image Loader
final class CachedAsyncImageLoader: ObservableObject {
    // MARK: - Parameters
    @Published var isLoading = true
    private let cache = NSCache<NSString, UIImage>()
    private var image = UIImage()
    private let imageIdForCache: String
    private let fullname: String
    private let urlString: String
    private lazy var initialsImage: UIImage = { getInitialsImage() }()
    
    // MARK: - Init
    init(imageIdForCache: String, fullname: String, urlString: String) {
        self.imageIdForCache = imageIdForCache
        self.fullname = fullname
        self.urlString = urlString
    }
    
    // MARK: - Functions
    func load() {
        DispatchQueue.global().async {
            if let cachedImage = ImageCacheManager.shared.get(name: self.imageIdForCache) {
                self.image = cachedImage
                DispatchQueue.main.async { self.isLoading = false }
            } else {
                if let url = URL(string: self.urlString) {
                    URLSession.shared.dataTask(with: url) { (data, _, _) in
                        if let data = data, let image = UIImage(data: data) {
                            self.image = image
                            ImageCacheManager.shared.add(image: image, name: self.imageIdForCache)
                            DispatchQueue.main.async { self.isLoading = false }
                        } else {
                            self.image = self.initialsImage
                            ImageCacheManager.shared.add(image: self.initialsImage, name: self.imageIdForCache)
                            DispatchQueue.main.async { self.isLoading = false }
                        }
                    }.resume()
                } else {
                    self.image = self.initialsImage
                    ImageCacheManager.shared.add(image: self.initialsImage, name: self.imageIdForCache)
                    DispatchQueue.main.async { self.isLoading = false }
                }
            }
        }
    }
    
    func getImage() -> UIImage {
        image
    }
    
    private func getInitialsImage() -> UIImage {
        return LetterAvatarMaker()
            .setCircle(true)
            .setUsername(fullname)
            .setLettersColor(.customBlack)
            .setBackgroundColors([ .customGray.withAlphaComponent(0.5) ])
            .build() ?? UIImage()
    }
}
