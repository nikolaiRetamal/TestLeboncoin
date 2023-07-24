//
//  RepositoryTests.swift
//  TestLeboncoinTests
//
//  Created by Nikolaï RETAMAL on 22/07/2023.
//

import Foundation
import XCTest
@testable import TestLeboncoin

class RepositoryTests: XCTestCase {
    
    func testProductSorting() async {
        InjectedValues[\.productDataSource] = ProductDataSourceMock()
        InjectedValues[\.categoryDataSource] = CategoryDataSourceMock()
        
        let repository = ProductRepository()
        
        do {
            // All products
            var products = try await repository.getProducts()
            XCTAssertEqual(products.count, 6)
            let productFromDTO = MockValues.successProductsDTO.first?.asDomain
            let productWithCategory = productFromDTO?.clone(with: Category(id: 2, name: "Véhicule"))
            XCTAssertEqual(products.first, productWithCategory)
            
            // Filtered
            products = try await repository.getProducts(of: 1)
            XCTAssertEqual(products.count, 3)
            
            products = try await repository.getProducts(of: 2)
            XCTAssertEqual(products.count, 2)
            
            products = try await repository.getProducts(of: 3)
            XCTAssertEqual(products.count, 1)
        } catch {
            XCTFail()
        }
    }
}
