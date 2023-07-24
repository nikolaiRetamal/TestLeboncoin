//
//  DataSourceMocks.swift
//  TestLeboncoinTests
//
//  Created by Nikolaï RETAMAL on 22/07/2023.
//

import Foundation
@testable import TestLeboncoin

struct CategoryDataSourceMock: CategoryDataSourceProtocol {
    func getCategories() async throws -> [TestLeboncoin.Category] {
        MockValues.successCategories
    }
}

struct ProductDataSourceMock: ProductDataSourceProtocol {
    func getProducts() async throws -> [TestLeboncoin.Product] {
        MockValues.successProducts
    }
}
