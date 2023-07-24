//
//  ProductListViewModelTests.swift
//  TestLeboncoinTests
//
//  Created by Nikolaï RETAMAL on 22/07/2023.
//

import Foundation
import XCTest
import Combine
@testable import TestLeboncoin

class ProductListViewModelTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()

    func testProductListWithValues() async {
        InjectedValues[\.networkProvider] = NetworkProviderMock(successValues: MockValues.successProductsDTO)
        InjectedValues[\.categoryDataSource] = CategoryDataSourceMock()
        let viewModel = await ProductListViewModel(coordinator: CoordinatorMock(navigationController: UINavigationController()))
        
        // fetch products success
        await viewModel.fetchData()
        XCTAssertEqual(viewModel.products.count, 6)
        // fetch filtered products success
        viewModel.selectedCategoryId = 1
        let expectedStates: [ViewState] = [.loading, .success, .idle]
        viewModel.$state.dropFirst().collect(3).sink(receiveValue: { states in
            XCTAssertEqual(states, expectedStates)
        }).store(in: &cancellables)
        await viewModel.fetchData()
        XCTAssertEqual(viewModel.products.count, 3)
    }

    func testProductListWithError() async {
        InjectedValues[\.networkProvider] = NetworkProviderErrorMock<Any>()
        InjectedValues[\.categoryDataSource] = CategoryDataSourceMock()
        
        let viewModel = await ProductListViewModel(coordinator: CoordinatorMock(navigationController: UINavigationController()))
        let expectedStates: [ViewState] = [.loading, .failure(NetworkError.badUrl.description), .idle]
        viewModel.$state.dropFirst().collect(3).sink(receiveValue: { states in
            XCTAssertEqual(states, expectedStates)
        }).store(in: &cancellables)

        // fetch products success
        await viewModel.fetchData()
    }
    
}

fileprivate struct CoordinatorMock: ProductFlowCoordinatorProtocol {
    func showDetails(of product: TestLeboncoin.Product) {}
    
    func showFilter(with selectedCategoryId: Int64?, onSelected: @escaping (Int64?) -> Void) {}
    
    func showFilteredProducts() {}
    
    var childCoordinators: [TestLeboncoin.Coordinator] = []
    
    var navigationController: UINavigationController
    
    func start() {}
}
