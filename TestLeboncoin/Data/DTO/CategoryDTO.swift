//
//  CategoryDTO.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

struct CategoryDTO: Decodable, Equatable {
    let id: Int64
    let name: String
}

extension CategoryDTO {
    var asDomain: Category {
        .init(id: id, name: name)
    }
}

extension Collection where Element == CategoryDTO {
    var asDomain: [Category] { self.map { $0.asDomain } }
}
