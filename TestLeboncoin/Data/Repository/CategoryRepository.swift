//
//  CategoryRepository.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

struct CategoryRepository: CategoryRepositoryProtocol {
    @Injected(\.categoryDataSource) var dataSource: CategoryDataSourceProtocol

    func getCategories() async throws -> [Category] {
        try await dataSource.getCategories()
    }
}
