//
//  PaddingLabel.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 21/07/2023.
//

import Foundation
import UIKit

class PaddingLabel: UILabel {
    var topInset: CGFloat = 2.0
    var bottomInset: CGFloat = 2.0
    var leftInset: CGFloat = 5.0
    var rightInset: CGFloat = 5.0

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset,
                                  left: leftInset,
                                  bottom: bottomInset,
                                  right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
}
