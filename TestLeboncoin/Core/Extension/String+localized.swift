//
//  String+localized.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

extension String {
    var localized: String { NSLocalizedString(self, comment: "") }
}
