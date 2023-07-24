//
//  CategoryCell.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 21/07/2023.
//

import Foundation
import UIKit

class CategoryCell: UITableViewCell {
    private lazy var categoryView: CategoryView = CategoryView()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
        setupConstraints()
    }
    private func initViews() {
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(categoryView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            categoryView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            categoryView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            categoryView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

    func configure(with model: CategoryViewModel) {
        categoryView.configure(with: model)
    }
}
