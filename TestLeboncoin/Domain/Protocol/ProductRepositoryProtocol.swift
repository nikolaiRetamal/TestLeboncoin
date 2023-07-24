//
//  ProductRepositoryProtocol.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

protocol ProductRepositoryProtocol {
    func getProducts() async throws -> [Product]
    func getProducts(of categoryId: Int64) async throws -> [Product]
}
