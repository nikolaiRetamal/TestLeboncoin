//
//  Product.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

struct Product: Equatable {
    let id: Int64
    let title: String
    let category: Category?
    var creationDate: Date
    let description: String
    let isUrgent: Bool
    let image: ProductImage
    let price: Float
    let siret: String?

    func clone(with category: Category?) -> Product {
        .init(id: id,
              title: title,
              category: category,
              creationDate: creationDate,
              description: description,
              isUrgent: isUrgent,
              image: image,
              price: price,
              siret: siret)
    }
}
