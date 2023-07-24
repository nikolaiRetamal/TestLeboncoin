//
//  FilterViewController.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 21/07/2023.
//

import Foundation
import UIKit
import Combine

class FilterViewController: LoaderController {
    var categoriesTableView: UITableView!
    var viewModel: FilterViewModel!
    var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        setupConstraints()
        bind()
        // We don't need to fetch the data here, since we already have everything we need
        // However in a real life situation we may (or may not) want to reload the categories
        // on the fly to have everything up-to-date
        viewModel.fetchData()
    }

    func initViews() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:"product.filter.clear".localized,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(clear))
        navigationItem.title = "product.filter.title".localized
        categoriesTableView = UITableView()
        categoriesTableView.dataSource = self
        categoriesTableView.delegate = self
        categoriesTableView.translatesAutoresizingMaskIntoConstraints = false
        categoriesTableView.separatorInset = .zero
        categoriesTableView.register(CategoryCell.self, forCellReuseIdentifier: "cell")
        categoriesTableView.layer.backgroundColor = UIColor.systemBackground.cgColor
        categoriesTableView.tableFooterView = UIView(frame: .zero)
        view.addSubview(categoriesTableView)
    }

    @objc func clear() {
        viewModel.clear()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            categoriesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoriesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            categoriesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            categoriesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func bind() {
        viewModel.$state.sink(receiveValue: { [weak self] state in
            self?.onDidChange(state)
        }).store(in: &cancellables)
    }
    
    func onDidChange(_ state: ViewState) {
        DispatchQueue.main.async {
            switch state {
            case .failure(let error):
                print("Implement some proper error handling, this was your error: \(error)")
                break
            case .success:
                self.categoriesTableView.reloadData()
            case .loading:
                self.showLoader()
                break
            case .idle:
                self.hideLoader()
            }
        }
    }
}

extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoriesTableView.dequeueReusableCell(withIdentifier: "cell") as! CategoryCell
        let category = viewModel.categories[indexPath.row]
        let isSelected = {
            if viewModel.selectedCategoryId == nil {
                return false
            }
            return viewModel.selectedCategoryId == category.id
        }()
        cell.configure(with: viewModel.categories[indexPath.row].asCategoryViewModel(and: isSelected))
    
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoriesTableView.deselectRow(at: indexPath, animated: true)
        viewModel.showProducts(at: indexPath.row)
    }
}
