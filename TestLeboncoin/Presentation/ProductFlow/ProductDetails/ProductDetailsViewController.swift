//
//  ProductDetailsViewController.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 21/07/2023.
//

import Foundation
import UIKit
import Combine

class ProductDetailsViewController: UIViewController {
    var cancellable: AnyCancellable?
    var viewModel: ProductDetailsViewModel!

    let scrollView = UIScrollView()
    let container = UIView()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        let style = Theme.Font.Primary.BigBold.self
        label.font = style.font
        label.textColor = style.color
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        let style = Theme.Font.Primary.BigBold.self
        label.font = style.font
        label.textColor = style.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        let style = Theme.Font.Secondary.BigRegular.self
        label.font = style.font
        label.textColor = style.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var isUrgentLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = Theme.Font.Primary.BigBold.font
        label.textAlignment = .left
        label.textColor = .orange
        label.backgroundColor = .orange.withAlphaComponent(0.5)
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        let style = Theme.Font.Secondary.BigRegular.self
        label.font = style.font
        label.textColor = style.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondaryLabel
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        let style = Theme.Font.Primary.BigBold.self
        label.font = style.font
        label.textColor = style.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        let style = Theme.Font.Primary.BigRegular.self
        label.font = style.font
        label.textColor = style.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var siretLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        let style = Theme.Font.Secondary.BigRegular.self
        label.font = style.font
        label.textColor = style.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [isUrgentLabel,
                                                       titleLabel,
                                                       priceLabel,
                                                       dateLabel,
                                                       categoryLabel,
                                                       siretLabel,
                                                       separatorView,
                                                       descriptionTitleLabel,
                                                       descriptionLabel])
        stackView.axis  = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.contentMode = .scaleAspectFit
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        initViews()
        setupConstraints()
        load(with: viewModel.product)
    }

    func initViews() {
        navigationItem.title = "product.details.title".localized
        setupScrollView()
        container.addSubview(imageView)
        container.addSubview(stackView)

        cancellable = viewModel.loadImage().sink { [weak self] image in
            self?.imageView.image = image
        }
    }

    func setupScrollView() {
        container.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(container)
        view.addSubview(scrollView)
    }

    func setupConstraints() {
        // ScrollView
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            container.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            container.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            container.topAnchor.constraint(equalTo: scrollView.topAnchor),
            container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])

        // Content
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: container.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }

    func load(with product: Product) {
        titleLabel.text = product.title
        priceLabel.text = product.price.formattedPrice
        dateLabel.text = "product.details.date.title".localized + product.creationDate.detailedFormatString
        categoryLabel.text = "product.details.category.title".localized + (product.category?.name).orEmpty
        descriptionTitleLabel.text = "product.details.description".localized
        descriptionLabel.text = product.description
        if let siret = product.siret {
            siretLabel.text = "product.details.siret.title".localized + siret
            siretLabel.isHidden = false
        } else {
            siretLabel.isHidden = true
        }
        if product.isUrgent {
            isUrgentLabel.text = "product.urgent".localized.uppercased()
            isUrgentLabel.isHidden = false
        } else {
            isUrgentLabel.isHidden = true
        }
    
        cancellable = viewModel.loadImage().sink { [weak self] image in
            self?.imageView.image = image
        }
    }
}
