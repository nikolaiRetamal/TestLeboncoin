//
//  NetworkProviderMock.swift
//  TestLeboncoinTests
//
//  Created by Nikolaï RETAMAL on 22/07/2023.
//

import Foundation
@testable import TestLeboncoin

class NetworkProviderMock<T>: NetworkProviderProtocol {
    private let successValues: T

    init(successValues: T) {
        self.successValues = successValues
    }

    func performRequest<T>(with urlStr: String, as type: T.Type) async throws -> T where T : Decodable {
        successValues as! T
    }
}

class NetworkProviderErrorMock<T>: NetworkProviderProtocol {
    func performRequest<T>(with urlStr: String, as type: T.Type) async throws -> T where T : Decodable {
        throw NetworkError.badUrl
    }
}
