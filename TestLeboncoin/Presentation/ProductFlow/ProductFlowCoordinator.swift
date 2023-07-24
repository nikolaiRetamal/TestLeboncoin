//
//  ProductFlowCoordinator.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation
import UIKit
protocol ProductFlowCoordinatorProtocol: Coordinator {
    func showDetails(of product: Product)
    func showFilter(with selectedCategoryId: Int64?, onSelected: @escaping (Int64?) -> Void)
    func showFilteredProducts()
    
}
class ProductFlowCoordinator: ProductFlowCoordinatorProtocol {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ViewControllerProvider.productList(with: self)
        navigationController.pushViewController(vc, animated: false)
    }
    func showDetails(of product: Product) {
        let vc = ViewControllerProvider.productDetails
        vc.viewModel.product = product
        navigationController.pushViewController(vc, animated: true)
    }

    func showFilter(with selectedCategoryId: Int64?, onSelected: @escaping (Int64?) -> Void) {
        let vc = ViewControllerProvider.categoryList(with: self, onSelected: onSelected)
        vc.viewModel.selectedCategoryId = selectedCategoryId
        let navController = UINavigationController(rootViewController: vc)
        self.navigationController.present(navController, animated: false)
    }

    func showFilteredProducts() {
        navigationController.dismiss(animated: true)
    }
}
