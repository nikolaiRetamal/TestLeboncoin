//
//  GetProductsUseCaseProtocol.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 20/07/2023.
//

import Foundation

protocol GetProductsUseCaseProtocol {
    func getProducts() async throws -> [Product]
    func getProducts(of categoryId: Int64) async throws -> [Product]
}
