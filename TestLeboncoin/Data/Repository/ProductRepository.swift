//
//  ProductRepository.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

struct ProductRepository: ProductRepositoryProtocol {
    @Injected(\.productDataSource) var productDataSource: ProductDataSourceProtocol
    @Injected(\.categoryDataSource) var categoryDataSource: CategoryDataSourceProtocol

    func getProducts() async throws -> [Product] {
        async let products = try await productDataSource.getProducts()
        async let categories = try await categoryDataSource.getCategories()
        let (fetchedProducts, fetchedCategories) = await (try products, try categories)
        var result = [Product]()
        fetchedProducts.forEach { fetchedProduct in
            let category = fetchedCategories.first(where: {$0.id == fetchedProduct.category?.id })
            result.append(fetchedProduct.clone(with: category))
        }
        return result
    }

    func getProducts(of categoryId: Int64) async throws -> [Product] {
        try await getProducts().filter { $0.category?.id == categoryId }
    }
}
