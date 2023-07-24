//
//  NetworkProvider.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

struct NetworkProvider: NetworkProviderProtocol {
    let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(.iso8601)
        return decoder
    }()

    func performRequest<T>(with urlStr: String, as type: T.Type) async throws -> T where T : Decodable {
        guard let url = URL(string: urlStr) else {
            throw NetworkError.badUrl
        }

        guard let (data, response) = try? await URLSession.shared.data(from: url),
              let response = response as? HTTPURLResponse,
              200...209 ~= response.statusCode else {
            throw NetworkError.requestError
        }

        guard let result = try? jsonDecoder.decode(type.self, from: data) else {
            throw NetworkError.decodingError
        }

        return result
    }
}
