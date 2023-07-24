//
//  GetProductsUseCase.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 20/07/2023.
//

import Foundation

struct GetProductsUseCase: GetProductsUseCaseProtocol {
    
    @Injected(\.productRepository) var repository: ProductRepositoryProtocol

    func getProducts() async throws -> [Product] {
        var products = try await repository.getProducts()
        sort(&products)
        return products
    }
    
    func getProducts(of categoryId: Int64) async throws -> [Product] {
        var products = try await repository.getProducts(of: categoryId)
        sort(&products)
        return products
    }
    
    private func sort(_ products: inout [Product]) {
        products.sort { first, second in
            let areBothUrgent = first.isUrgent && second.isUrgent
            let neitherIsUrgent = !first.isUrgent && !second.isUrgent
            if  areBothUrgent || neitherIsUrgent {
                return first.creationDate > second.creationDate
            }

            return first.isUrgent && !second.isUrgent
        }
    }
}
