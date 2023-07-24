//
//  NetworkProviderProtocol.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

protocol NetworkProviderProtocol {
    func performRequest<T: Decodable>(with urlStr: String, as type: T.Type) async throws -> T
}
