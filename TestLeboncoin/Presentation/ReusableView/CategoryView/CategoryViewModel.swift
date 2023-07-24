//
//  CategoryViewModel.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 21/07/2023.
//

import Foundation

struct CategoryViewModel: Equatable {
    let title: String
    let isSelected: Bool
}

extension Category {
    func asCategoryViewModel(and isSelected: Bool) -> CategoryViewModel {
        .init(title: name, isSelected: isSelected)
    }
}
