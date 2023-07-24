//
//  ProductListCell.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 20/07/2023.
//

import Foundation
import UIKit

class ProductListCell: UICollectionViewCell {
    private lazy var productListItemView = ProductListItemView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initViews() {
        layer.cornerRadius = 10
        backgroundColor = .systemBackground
        productListItemView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(productListItemView)

    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productListItemView.topAnchor.constraint(equalTo: topAnchor),
            productListItemView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productListItemView.trailingAnchor.constraint(equalTo: trailingAnchor),
            productListItemView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func configure(with model: ProductListItemViewModel) {
        productListItemView.configure(with: model)
    }

    override public func prepareForReuse() {
        super.prepareForReuse()
        productListItemView.prepareForReuse()
    }
}
