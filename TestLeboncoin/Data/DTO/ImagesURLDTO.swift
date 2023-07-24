//
//  ImagesURLDTO.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

struct ImagesURLDTO: Decodable, Equatable {
    let small: String?
    let thumb: String?
}

extension ImagesURLDTO {
    var asDomain: ProductImage {
        .init(small: small ?? "", thumbnail: thumb ?? "")
    }
}

extension Collection where Element == ImagesURLDTO {
    var asDomain: [ProductImage] { self.map { $0.asDomain } }
}
