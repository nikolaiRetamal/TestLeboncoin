//
//  DataSourceTests.swift
//  TestLeboncoinTests
//
//  Created by Nikolaï RETAMAL on 21/07/2023.
//

import Foundation
import XCTest
@testable import TestLeboncoin

class DataSourceTests: XCTestCase {

    func testCategoryDataSource() async {
        InjectedValues[\.networkProvider] = NetworkProviderMock(successValues: MockValues.successCategoriesDTO)
        let dataSource = CategoryDataSourceAPI()

        do {
            let categories = try await dataSource.getCategories()
            XCTAssertEqual(categories.count, 3)
            XCTAssertEqual(categories.first, MockValues.successCategoriesDTO.first?.asDomain)
        } catch {
            XCTFail()
        }
    }

    func testProductDataSource() async {
        InjectedValues[\.networkProvider] = NetworkProviderMock(successValues: MockValues.successProductsDTO)
        let dataSource = ProductDataSourceAPI()

        do {
            let products = try await dataSource.getProducts()
            XCTAssertEqual(products.count, 6)
            XCTAssertEqual(products.first, MockValues.successProductsDTO.first?.asDomain)
        } catch {
            XCTFail()
        }
        
        
        

    }
}
