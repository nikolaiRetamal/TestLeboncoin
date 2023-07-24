//
//  ProductDataSourceProtocol.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

protocol ProductDataSourceProtocol {
    func getProducts() async throws -> [Product]
}
