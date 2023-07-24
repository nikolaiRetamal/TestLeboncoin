//
//  UseCaseTests.swift
//  TestLeboncoinTests
//
//  Created by Nikolaï RETAMAL on 22/07/2023.
//

import Foundation

import XCTest
@testable import TestLeboncoin

class UseCaseTests: XCTestCase {
    
    func testGetProductUseCase() async {
        InjectedValues[\.networkProvider] = NetworkProviderMock(successValues: MockValues.successProductsDTO)
        InjectedValues[\.categoryDataSource] = CategoryDataSourceMock()
        let useCase = GetProductsUseCase()

        do {
            let unsortedProducts = MockValues.successProducts
            var expectedResults: [(productIndex: Int,
                                  productId: Int64)]
            expectedResults = [(0,1),(1,2), (2,3), (3,4), (4,5), (5,6)]
            for result in expectedResults {
                XCTAssertEqual(unsortedProducts[result.productIndex].id,
                               result.productId)
            }
            // Sorting order of all products result in sorted list by urgency and then date
            var products = try await useCase.getProducts()
            expectedResults = [(0,6),(1,4), (2,3), (3,1), (4,2), (5,5)]
            for result in expectedResults {
                XCTAssertEqual(products[result.productIndex].id,
                               result.productId)
            }
            // Same with filter by category
            products = try await useCase.getProducts(of: 1)
            expectedResults = [(0,4),(1,3), (2,5)]
            for result in expectedResults {
                XCTAssertEqual(products[result.productIndex].id,
                               result.productId)
            }
        } catch {
            XCTFail()
        }
    }

    func testGetCategoriesUseCase() async {
        InjectedValues[\.categoryDataSource] = CategoryDataSourceMock()
        let useCase = GetCategoriesUseCase()

        do {
            let unsortedCategories = MockValues.successCategories
            XCTAssertEqual(unsortedCategories[0].id, 1)
            XCTAssertEqual(unsortedCategories[1].id, 3)
            XCTAssertEqual(unsortedCategories[2].id, 2)
            // Sorting order of all products result in sorted list by urgency and then date
            let categories = try await useCase.getCategories()
            XCTAssertEqual(categories[0].id, 1)
            XCTAssertEqual(categories[1].id, 2)
            XCTAssertEqual(categories[2].id, 3)
        } catch {
            XCTFail()
        }
    }
}
