//
//  Theme.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 20/07/2023.
//

import Foundation
import UIKit
enum Theme {
    enum Font {
        enum Primary {
            enum Bold {
                static let font = UIFont.systemFont(ofSize: 15, weight: .bold)
                static let color = UIColor.label
            }
            enum BigBold {
                static let font = UIFont.systemFont(ofSize: 17, weight: .bold)
                static let color = UIColor.label
            }
            enum Regular {
                static let font = UIFont.systemFont(ofSize: 15, weight: .regular)
                static let color = UIColor.label
            }
            enum BigRegular {
                static let font = UIFont.systemFont(ofSize: 17, weight: .regular)
                static let color = UIColor.label
            }
        }
        enum Secondary {
            enum Regular {
                static let font = UIFont.systemFont(ofSize: 13, weight: .regular)
                static let color = UIColor.secondaryLabel
            }
            enum BigRegular {
                static let font = UIFont.systemFont(ofSize: 15, weight: .regular)
                static let color = UIColor.secondaryLabel
            }
        }
    }
    
}
