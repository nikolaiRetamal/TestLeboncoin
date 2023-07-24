//
//  ProductListViewModel.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 20/07/2023.
//

import Foundation
import Combine

class ProductListViewModel {
    @Injected(\.getProductsUseCase) var getProductsUseCase: GetProductsUseCaseProtocol

    private var coordinator: ProductFlowCoordinatorProtocol
    var products = [Product]()
    var selectedCategoryId: Int64?
    @Published var state: ViewState = .idle

    init(coordinator: ProductFlowCoordinatorProtocol) {
        self.coordinator = coordinator
    }

    func fetchData() async {
        defer { state = .idle }
        do {
            state = .loading
            // To showcase loader
            try await Task.sleep(nanoseconds: 500_000_000)
            if let filter = selectedCategoryId {
                products = try await getProductsUseCase.getProducts(of: filter)
            } else {
                products = try await getProductsUseCase.getProducts()
            }
            state = .success
        } catch let error as NetworkError {
            state = .failure(error.description)
        } catch {
            print("Unexpected error")
        }
    }
}

// MARK: Navigation
extension ProductListViewModel {
    func showDetails(of productItemIndex: Int) {
        if let product = products[safe: productItemIndex] {
            coordinator.showDetails(of: product)
        }
    }

    func showFilter() {
        coordinator.showFilter(with: selectedCategoryId) { [weak self] newSelectedCategoryId in
            self?.selectedCategoryId = newSelectedCategoryId
            Task { [weak self] in
                await self?.fetchData()
            }
        }
    }
}
