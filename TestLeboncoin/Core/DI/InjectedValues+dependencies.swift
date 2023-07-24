//
//  InjectedValues+dependencies.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation

extension InjectedValues {
    var networkProvider: NetworkProviderProtocol {
        get { Self[NetworkProviderKey.self] }
        set { Self[NetworkProviderKey.self] = newValue }
    }
    var imageLoader: ImageLoaderProtocol {
        get { Self[ImageLoaderProtocolKey.self] }
        set { Self[ImageLoaderProtocolKey.self] = newValue }
    }
    // MARK: Data Sources
    var categoryDataSource: CategoryDataSourceProtocol {
        get { Self[CategoryDataSourceKey.self] }
        set { Self[CategoryDataSourceKey.self] = newValue }
    }
    var productDataSource: ProductDataSourceProtocol {
        get { Self[ProductDataSourceKey.self] }
        set { Self[ProductDataSourceKey.self] = newValue }
    }
    // MARK: Repositories
    var categoryRepository: CategoryRepositoryProtocol {
        get { Self[CategoryRepositoryKey.self] }
        set { Self[CategoryRepositoryKey.self] = newValue }
    }
    var productRepository: ProductRepositoryProtocol {
        get { Self[ProductRepositoryKey.self] }
        set { Self[ProductRepositoryKey.self] = newValue }
    }
    // MARK: Use cases
    var getCategoriesUseCase: GetCategoriesUseCaseProtocol {
        get { Self[GetCategoriesUseKey.self] }
        set { Self[GetCategoriesUseKey.self] = newValue }
    }
    var getProductsUseCase: GetProductsUseCaseProtocol {
        get { Self[GetProductsUseCaseKey.self] }
        set { Self[GetProductsUseCaseKey.self] = newValue }
    }
    
}
// MARK: Default values
private struct NetworkProviderKey: InjectionKey {
    static var currentValue: NetworkProviderProtocol = NetworkProvider()
}
private struct ImageLoaderProtocolKey: InjectionKey {
    static var currentValue: ImageLoaderProtocol = ImageLoader()
}
// MARK: Data Sources keys
private struct CategoryDataSourceKey: InjectionKey {
    static var currentValue: CategoryDataSourceProtocol = CategoryDataSourceAPI()
}

private struct ProductDataSourceKey: InjectionKey {
    static var currentValue: ProductDataSourceProtocol = ProductDataSourceAPI()
}

// MARK: Repositories keys
private struct CategoryRepositoryKey: InjectionKey {
    static var currentValue: CategoryRepositoryProtocol = CategoryRepository()
}

private struct ProductRepositoryKey: InjectionKey {
    static var currentValue: ProductRepositoryProtocol = ProductRepository()
}

// MARK: Use cases keys

private struct GetCategoriesUseKey: InjectionKey {
    static var currentValue: GetCategoriesUseCaseProtocol = GetCategoriesUseCase()
}

private struct GetProductsUseCaseKey: InjectionKey {
    static var currentValue: GetProductsUseCaseProtocol = GetProductsUseCase()
}
