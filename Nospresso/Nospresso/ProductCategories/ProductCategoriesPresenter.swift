//
//  ProductCategoriesPresenter.swift
//  Nospresso
//
//  Created by Juan Andrey Valverde Malska on 21/07/22.
//

import Foundation

class ProductCategoriesPresenter {
    
    weak var view: ProductCategoriesViewControllerProtocol?
    let coordinator: ProductCategoriesCoordinatorProtocol
    
    init(coordinator: ProductCategoriesCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
}

extension ProductCategoriesPresenter: ProductCategoriesPresenterProtocol {
    
    
    
}
