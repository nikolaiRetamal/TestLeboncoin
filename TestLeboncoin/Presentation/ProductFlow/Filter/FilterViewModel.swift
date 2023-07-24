//
//  FilterViewModel.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 21/07/2023.
//

import Foundation

class FilterViewModel {
    @Injected(\.getCategoriesUseCase) var getCategoriesUseCase: GetCategoriesUseCaseProtocol

    private var coordinator: ProductFlowCoordinatorProtocol
    var selectedCategoryId: Int64?
    private var onSelected: (Int64?) -> Void
    var categories = [Category]()
    
    @Published var state: ViewState = .idle
    
    init(coordinator: ProductFlowCoordinatorProtocol, onSelected: @escaping (Int64?) -> Void) {
        self.coordinator = coordinator
        self.onSelected = onSelected
    }

    func fetchData() {
        Task {
            defer { state = .idle }
            do {
                state = .loading
                // To showcase loader
                try await Task.sleep(nanoseconds: 500_000_000)
                let categories = try await getCategoriesUseCase.getCategories()
                self.categories = categories
                state = .success
            } catch(let error) {
                state = .failure(error.localizedDescription)
            }
        }
    }
    func showProducts(at index: Int) {
        guard let category = categories[safe: index] else { return }
        coordinator.showFilteredProducts()
        onSelected(category.id)
    }

    func clear() {
        coordinator.showFilteredProducts()
        onSelected(nil)
    }
}
