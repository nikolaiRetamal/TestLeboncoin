//
//  NetworkError.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

enum NetworkError: Error {
    case badUrl,
        requestError,
        decodingError

    var description: String {
        switch self {
        case .badUrl: return "network.error.badUrl".localized
        case .requestError: return "network.error.requestError".localized
        case .decodingError: return "network.error.decodingError".localized
        }
    }
}
