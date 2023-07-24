//
//  GetCategoriesUseCaseProtocol.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 20/07/2023.
//

import Foundation

protocol GetCategoriesUseCaseProtocol {
    func getCategories() async throws -> [Category]
}
