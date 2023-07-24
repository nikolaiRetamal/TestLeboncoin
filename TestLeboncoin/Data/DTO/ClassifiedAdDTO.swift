//
//  ClassifiedAdDTO.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

struct ClassifiedAdDTO: Decodable, Equatable {
    let id: Int64
    let title: String
    let categoryId: Int64
    var creationDate: Date
    let description: String
    let isUrgent: Bool
    let imagesUrl: ImagesURLDTO
    let price: Float
    let siret: String?
}

extension ClassifiedAdDTO {
    var asDomain: Product {
        .init(id: id,
              title: title,
              category: Category(id: categoryId, name: ""),
              creationDate: creationDate,
              description: description,
              isUrgent: isUrgent,
              image: imagesUrl.asDomain,
              price: price,
              siret: siret)
    }
}

extension Collection where Element == ClassifiedAdDTO {
    var asDomain: [Product] { self.map { $0.asDomain } }
}
