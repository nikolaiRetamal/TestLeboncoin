//
//  ViewControllerProvider.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

enum ViewControllerProvider {
    static func productList(with coordinator: ProductFlowCoordinatorProtocol) -> ProductListViewController {
        let vc = ProductListViewController()
        vc.viewModel = ViewModelProvider.productList(with: coordinator)
        return vc
    }
    static func categoryList(with coordinator: ProductFlowCoordinatorProtocol,
                             onSelected: @escaping (Int64?) -> Void) -> FilterViewController {
        let vc = FilterViewController()
        vc.viewModel = ViewModelProvider.categoryList(with: coordinator, onSelected: onSelected)
        return vc
    }
    static var productDetails: ProductDetailsViewController {
        let vc = ProductDetailsViewController()
        vc.viewModel = ViewModelProvider.productDetails
        return vc
    }
}
