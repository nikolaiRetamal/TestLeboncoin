//
//  CategoryViewTests.swift
//  TestLeboncoinTests
//
//  Created by Nikolaï RETAMAL on 22/07/2023.
//

import XCTest
@testable import TestLeboncoin

class CategoryViewTests: XCTestCase {
    func testInitWithModel() {
        let view = CategoryView()
        // Mapping
        XCTAssertEqual(MockValues.categoryViewModelSelected,
                       Category(id: 1,
                                name: "dummyCategory").asCategoryViewModel(and: true))
        // States
        view.configure(with: MockValues.categoryViewModelSelected)
        XCTAssertEqual(view.titleLabel.font, Theme.Font.Primary.BigBold.font)
        view.configure(with: MockValues.categoryViewModelNotSelected)
        XCTAssertEqual(view.titleLabel.font, Theme.Font.Primary.BigRegular.font)
    }
}
