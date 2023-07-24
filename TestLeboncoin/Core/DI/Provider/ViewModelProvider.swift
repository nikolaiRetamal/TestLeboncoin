//
//  ViewModelProvider.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

enum ViewModelProvider {
    static func productList(with coordinator: ProductFlowCoordinatorProtocol) -> ProductListViewModel {
        ProductListViewModel(coordinator: coordinator)
    }
    static func categoryList(with coordinator: ProductFlowCoordinatorProtocol,
                             onSelected: @escaping (Int64?) -> Void) -> FilterViewModel {
        FilterViewModel(coordinator: coordinator, onSelected: onSelected)
    }
    static var productDetails: ProductDetailsViewModel {
        ProductDetailsViewModel()
    }
}
