//
//  ProductListViewController.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation
import UIKit
import Combine

class ProductListViewController: LoaderController {
    var viewModel: ProductListViewModel!
    var cancellables = Set<AnyCancellable>()

    lazy var compositionalLayout = UICollectionViewCompositionalLayout { _ , environment -> NSCollectionLayoutSection? in
        let itemsPerRow = environment.traitCollection.horizontalSizeClass == .compact ? 2 : 4
        let fraction: CGFloat = 1 / CGFloat(itemsPerRow)
        
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction),
                                              heightDimension: .absolute(300))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let inset: CGFloat = 5

        item.contentInsets = NSDirectionalEdgeInsets(top: inset,
                                                     leading: inset,
                                                     bottom: inset,
                                                     trailing: inset)
        
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(300))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: inset,
                                                        leading: inset,
                                                        bottom: inset,
                                                        trailing: inset)
        return section
    }

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.frame,
                                              collectionViewLayout: compositionalLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductListCell.self, forCellWithReuseIdentifier: "ProductCell")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        Task {
            await viewModel.fetchData()
        }
        initViews()
        setupConstraints()
        bind()
    }

    func initViews() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease.circle"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(showFilter))
        navigationItem.title = "product.list.title".localized
        view.addSubview(collectionView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc func showFilter() {
        viewModel.showFilter()
    }

    func bind() {
        viewModel.$state.sink(receiveValue: { [weak self] state in
            self?.onDidChange(state)
        }).store(in: &cancellables)
    }

    func onDidChange(_ state: ViewState) {
        DispatchQueue.main.async {
            switch state {
            case .success:
                self.collectionView.reloadData()
            case .failure(let error):
                print("Implement some proper error handling, this was your error: \(error)")
                break
            case .loading:
                self.showLoader()
                break
            case .idle:
                self.hideLoader()
            }
        }
    }
}

extension ProductListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        viewModel.showDetails(of: indexPath.row)
    }
}

extension ProductListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductListCell
        cell.configure(with: viewModel.products[indexPath.row].asProductListItemViewModel)
        return cell
    }
}
