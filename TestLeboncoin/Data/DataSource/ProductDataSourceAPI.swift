//
//  ProductDataSourceAPI.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

struct ProductDataSourceAPI: ProductDataSourceProtocol {
    @Injected(\.networkProvider) var networkProvider: NetworkProviderProtocol
    @Injected(\.categoryDataSource) var categoryDataSource: CategoryDataSourceProtocol

    // This should be stored somewhere else in a setting file (e.g. plist file, xconfig, etc.)
    private let urlStr = "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json"

    func getProducts() async throws -> [Product] {
        let productsDTO = try await networkProvider.performRequest(with: urlStr,
                                                                   as: [ClassifiedAdDTO].self)
        return productsDTO.asDomain
    }
}
