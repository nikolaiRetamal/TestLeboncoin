//
//  MockValues.swift
//  TestLeboncoinTests
//
//  Created by Nikolaï RETAMAL on 22/07/2023.
//

import Foundation
@testable import TestLeboncoin

enum MockValues {
    static let successCategories = [Category(id: 1, name: "Immobilier"),
                                    Category(id: 3, name: "Animaux"),
                                    Category(id: 2, name: "Véhicule")]
    static let successCategoriesDTO = [CategoryDTO(id: 1, name: "Immobilier"),
                                       CategoryDTO(id: 3, name: "Animaux"),
                                       CategoryDTO(id: 2, name: "Véhicule")]
    static let successProducts = [Product(id: 1,
                                          title: "titre article",
                                          category: Category(id: 2, name: "Véhicule"),
                                          creationDate: DateFormatter.iso8601.date(from: "2019-11-05T20:04:29+0000") ?? Date(),
                                          description: "some description",
                                          isUrgent: false,
                                          image: ProductImage(small: "", thumbnail: ""),
                                          price: 299.00,
                                          siret: "994 431 346"),
                                  Product(id: 2,
                                          title: "titre article",
                                          category: Category(id: 2, name: "Véhicule"),
                                          creationDate: DateFormatter.iso8601.date(from: "2019-11-03T20:04:29+0000") ?? Date(),
                                          description: "some description",
                                          isUrgent: false,
                                          image: ProductImage(small: "", thumbnail: ""),
                                          price: 299.00,
                                          siret: "994 431 346"),
                                  Product(id: 3,
                                          title: "titre article",
                                          category: Category(id: 1, name: "Immobilier"),
                                          creationDate: DateFormatter.iso8601.date(from: "2019-11-07T20:04:29+0000") ?? Date(),
                                          description: "some description",
                                          isUrgent: false,
                                          image: ProductImage(small: "", thumbnail: ""),
                                          price: 299.00,
                                          siret: "994 431 346"),
                                  Product(id: 4,
                                          title: "titre article",
                                          category: Category(id: 1, name: "Immobilier"),
                                          creationDate: DateFormatter.iso8601.date(from: "2019-11-02T20:04:29+0000") ?? Date(),
                                          description: "some description",
                                          isUrgent: true,
                                          image: ProductImage(small: "", thumbnail: ""),
                                          price: 299.00,
                                          siret: "994 431 346"),
                                  Product(id: 5,
                                          title: "titre article",
                                          category: Category(id: 1, name: "Immobilier"),
                                          creationDate: DateFormatter.iso8601.date(from: "2019-11-03T10:04:29+0000") ?? Date(),
                                          description: "some description",
                                          isUrgent: false,
                                          image: ProductImage(small: "", thumbnail: ""),
                                          price: 299.00,
                                          siret: "994 431 346"),
                                  Product(id: 6,
                                          title: "titre article",
                                          category: Category(id: 3, name: "Animaux"),
                                          creationDate: DateFormatter.iso8601.date(from: "2019-11-03T08:04:29+0000") ?? Date(),
                                          description: "some description",
                                          isUrgent: true,
                                          image: ProductImage(small: "", thumbnail: ""),
                                          price: 299.00,
                                          siret: "994 431 346")]
    static let successProductsDTO = [ClassifiedAdDTO(id: 1,
                                                     title: "titre article",
                                                     categoryId: 2,
                                                     creationDate: DateFormatter.iso8601.date(from: "2019-11-05T20:04:29+0000") ?? Date(),
                                                     description: "some description",
                                                     isUrgent: false,
                                                     imagesUrl: ImagesURLDTO(small: "", thumb: ""),
                                                     price: 299.00,
                                                     siret: "994 431 346"),
                                     ClassifiedAdDTO(id: 2,
                                                     title: "titre article",
                                                     categoryId: 2,
                                                     creationDate: DateFormatter.iso8601.date(from: "2019-11-03T20:04:29+0000") ?? Date(),
                                                     description: "some description",
                                                     isUrgent: false,
                                                     imagesUrl: ImagesURLDTO(small: "", thumb: ""),
                                                     price: 299.00,
                                                     siret: "994 431 346"),
                                     ClassifiedAdDTO(id: 3,
                                                     title: "titre article",
                                                     categoryId: 1,
                                                     creationDate: DateFormatter.iso8601.date(from: "2019-11-07T20:04:29+0000") ?? Date(),
                                                     description: "some description",
                                                     isUrgent: false,
                                                     imagesUrl: ImagesURLDTO(small: "", thumb: ""),
                                                     price: 299.00,
                                                     siret: "994 431 346"),
                                     ClassifiedAdDTO(id: 4,
                                                     title: "titre article",
                                                     categoryId: 1,
                                                     creationDate: DateFormatter.iso8601.date(from: "2019-11-02T20:04:29+0000") ?? Date(),
                                                     description: "some description",
                                                     isUrgent: true,
                                                     imagesUrl: ImagesURLDTO(small: "", thumb: ""),
                                                     price: 299.00,
                                                     siret: "994 431 346"),
                                     ClassifiedAdDTO(id: 5,
                                                     title: "titre article",
                                                     categoryId: 1,
                                                     creationDate: DateFormatter.iso8601.date(from: "2019-11-03T10:04:29+0000") ?? Date(),
                                                     description: "some description",
                                                     isUrgent: false,
                                                     imagesUrl: ImagesURLDTO(small: "", thumb: ""),
                                                     price: 299.00,
                                                     siret: "994 431 346"),
                                     ClassifiedAdDTO(id: 6,
                                                     title: "titre article",
                                                     categoryId: 3,
                                                     creationDate: DateFormatter.iso8601.date(from: "2019-11-03T08:04:29+0000") ?? Date(),
                                                     description: "some description",
                                                     isUrgent: true,
                                                     imagesUrl: ImagesURLDTO(small: "", thumb: ""),
                                                     price: 299.00,
                                                     siret: "994 431 346")]
    static let categoryViewModelSelected = CategoryViewModel(title: "dummyCategory",
                                                             isSelected: true)
    static let categoryViewModelNotSelected = CategoryViewModel(title: "dummyCategory",
                                                                isSelected: false)
    static let productListItemModel = ProductListItemViewModel(imagePath: "",
                                                               title: "titre article",
                                                               category: "Véhicule",
                                                               date: "05/11/2019 à 21:04",
                                                               isUrgent: false,
                                                               price: "299,00 €")
    static let productListItemModelUrgent = ProductListItemViewModel(imagePath: "",
                                                                     title: "titre article",
                                                                     category: "Véhicule",
                                                                     date: "05/11/2019 à 21:04",
                                                                     isUrgent: true,
                                                                     price: "299,00 €")
}
