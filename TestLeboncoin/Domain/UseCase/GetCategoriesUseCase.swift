//
//  GetCategoriesUseCase.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 20/07/2023.
//

import Foundation

struct GetCategoriesUseCase: GetCategoriesUseCaseProtocol {
    @Injected(\.categoryRepository) var repository: CategoryRepositoryProtocol

    func getCategories() async throws -> [Category] {
        var categories = try await repository.getCategories()
        categories.sort { $0.id < $1.id }
        return categories
    }
}
