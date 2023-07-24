//
//  ProductListItemView.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 21/07/2023.
//

import Foundation
import UIKit
import Combine

class ProductListItemView: UIView {
    @Injected(\.imageLoader) var imageLoader: ImageLoaderProtocol
    private var cancellable: AnyCancellable?
    private var animator: UIViewPropertyAnimator?

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        let style = Theme.Font.Primary.Bold.self
        label.font = style.font
        label.textColor = style.color
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var priceLabel: UILabel = {
        let label = UILabel()
        let style = Theme.Font.Primary.Bold.self
        label.font = style.font
        label.textColor = style.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        let style = Theme.Font.Secondary.Regular.self
        label.font = style.font
        label.textColor = style.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var isUrgentLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = Theme.Font.Primary.Bold.font
        label.textAlignment = .center
        label.textColor = .orange
        label.backgroundColor = .orange.withAlphaComponent(0.5)
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        let style = Theme.Font.Secondary.Regular.self
        label.font = style.font
        label.textColor = style.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func stackView(with arrangedSubviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis  = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initViews() {
        let upperStackView = stackView(with:[imageView,
                                             isUrgentLabel,
                                             titleLabel,
                                             priceLabel])
        let lowerStackView = stackView(with:[categoryLabel,
                                             dateLabel])
        addSubview(upperStackView)
        addSubview(lowerStackView)

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 150),
            upperStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            upperStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            upperStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            lowerStackView.topAnchor.constraint(greaterThanOrEqualTo: upperStackView.bottomAnchor, constant: 5),
            lowerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            lowerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            lowerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }

    func configure(with model: ProductListItemViewModel) {
        titleLabel.text = model.title
        priceLabel.text = model.price
        categoryLabel.text = model.category
        dateLabel.text = model.date
        if model.isUrgent {
            isUrgentLabel.text = "product.urgent".localized.uppercased()
            isUrgentLabel.isHidden = false
        } else {
            isUrgentLabel.isHidden = true
        }
        if let imagePath = model.imagePath, !imagePath.isEmpty {
            cancellable = loadImage(from: imagePath).sink { [weak self] image in self?.showImage(image: image) }
        }
    }

    func prepareForReuse() {
        imageView.image = nil
        imageView.alpha = 0.0
        animator?.stopAnimation(true)
        cancellable?.cancel()
    }

    private func showImage(image: UIImage?) {
        imageView.alpha = 0.0
        animator?.stopAnimation(false)
        imageView.image = image
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3,
                                                                  delay: 0,
                                                                  options: .curveLinear,
                                                                  animations: { [weak self] in
            self?.imageView.alpha = 1.0
        })
    }

    private func loadImage(from path: String) -> AnyPublisher<UIImage?, Never> {
        guard let url = URL(string: path) else {
            return Just(nil).eraseToAnyPublisher()
        }

        return Just(url)
            .flatMap({ [unowned self] imageUrl -> AnyPublisher<UIImage?, Never> in
                return self.imageLoader.loadImage(from: imageUrl)
            })
            .eraseToAnyPublisher()
    }
}
