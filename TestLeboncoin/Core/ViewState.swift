//
//  ViewState.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 20/07/2023.
//

import Foundation

enum ViewState: Equatable {
    case idle,
         loading,
         failure(String),
         success
}
