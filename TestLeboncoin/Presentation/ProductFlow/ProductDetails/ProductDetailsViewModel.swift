//
//  ProductDetailsViewModel.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 21/07/2023.
//

import Foundation
import UIKit.UIImage
import Combine

class ProductDetailsViewModel {
    @Injected(\.imageLoader) var imageLoader: ImageLoaderProtocol
    var product: Product!

    func loadImage() -> AnyPublisher<UIImage?, Never> {
        guard let path = product.image.thumbnail,
              let url = URL(string: path)else {
            return Just(nil).eraseToAnyPublisher()
        }

        return Just(url)
            .flatMap({ [unowned self] imageUrl -> AnyPublisher<UIImage?, Never> in
                return self.imageLoader.loadImage(from: imageUrl)
            })
            .eraseToAnyPublisher()
    }
}
