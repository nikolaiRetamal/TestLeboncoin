//
//  ProductListItemViewTests.swift
//  TestLeboncoinTests
//
//  Created by Nikolaï RETAMAL on 22/07/2023.
//

import Foundation

import XCTest
@testable import TestLeboncoin

class ProductListItemViewTests: XCTestCase {

    func testModelMapping() {
        // Mapping
        let product = MockValues.successProducts.first
        let productViewModel = product!.asProductListItemViewModel
        let expectedModel = MockValues.productListItemModel
        XCTAssertEqual(productViewModel, expectedModel)
    }
    func testConfiguration() {
        // Mapping
        let view = ProductListItemView()
        let model = MockValues.productListItemModel
        let modelUrgent = MockValues.productListItemModelUrgent
        
        view.configure(with: model)
        XCTAssertEqual(view.titleLabel.text, model.title)
        XCTAssertEqual(view.priceLabel.text, model.price)
        XCTAssertEqual(view.categoryLabel.text, model.category)
        XCTAssertEqual(view.dateLabel.text, model.date)
        XCTAssertTrue(view.isUrgentLabel.isHidden)

        view.configure(with: modelUrgent)
        XCTAssertFalse(view.isUrgentLabel.isHidden)
        XCTAssertEqual(view.isUrgentLabel.text, "product.urgent".localized.uppercased())
    }
}
