//
//  ProductListItemViewModel.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 21/07/2023.
//

import Foundation

struct ProductListItemViewModel: Equatable {
    let imagePath: String?
    let title: String
    let category: String
    let date: String
    let isUrgent: Bool
    let price: String
}

extension Product {
    var asProductListItemViewModel: ProductListItemViewModel {
        .init(imagePath: image.small,
              title: title,
              category: (category?.name).orEmpty,
              date: creationDate.detailedFormatString,
              isUrgent: isUrgent,
              price: price.formattedPrice)
    }
}
