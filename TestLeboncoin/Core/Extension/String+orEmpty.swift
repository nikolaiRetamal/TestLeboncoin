//
//  String+orEmpty.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 1ç/07/2023.
//

import Foundation

extension Optional where Wrapped == String {
    var orEmpty: String { self ?? "" }
}
