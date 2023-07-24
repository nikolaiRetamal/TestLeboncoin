//
//  CategoryRepositoryProtocol.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

protocol CategoryRepositoryProtocol {
    func getCategories() async throws -> [Category]
}
