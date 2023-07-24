//
//  Float+formattedPrice.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 20/07/2023.
//

import Foundation

extension Float {
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.numberStyle = .currency
        return formatter.string(from: self as NSNumber).orEmpty
    }
}
