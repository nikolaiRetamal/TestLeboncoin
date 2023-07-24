//
//  CategoryDataSourceAPI.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

struct CategoryDataSourceAPI: CategoryDataSourceProtocol {
    @Injected(\.networkProvider) var networkProvider: NetworkProviderProtocol
    // This should be stored somewhere else in a setting file (e.g. plist file, xconfig, etc.)
    private let urlStr = "https://raw.githubusercontent.com/leboncoin/paperclip/master/categories.json"

    func getCategories() async throws -> [Category] {
        let categoriesDTO = try await networkProvider.performRequest(with: urlStr,
                                                                     as: [CategoryDTO].self)
        return categoriesDTO.asDomain
    }
}
