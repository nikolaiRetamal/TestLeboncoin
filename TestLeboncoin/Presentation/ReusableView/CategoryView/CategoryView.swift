//
//  CategoryView.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 21/07/2023.
//

import Foundation
import UIKit

class CategoryView: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initViews() {
        addSubview(titleLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func configure(with model: CategoryViewModel) {
        titleLabel.text = model.title
        if model.isSelected {
            let style = Theme.Font.Primary.BigBold.self
            titleLabel.font = style.font
            titleLabel.textColor = style.color
        } else {
            let style = Theme.Font.Primary.BigRegular.self
            titleLabel.font = style.font
            titleLabel.textColor = style.color
        }
    }
}
