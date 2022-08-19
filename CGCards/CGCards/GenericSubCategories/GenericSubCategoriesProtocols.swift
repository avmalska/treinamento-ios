import Foundation
import UIKit

// Presenter -> Coordinator
internal protocol GenericSubCategoriesCoordinatorProtocol {
    func openCardSearch(filterName: String, filterDetail: String, filterTitle: String)
}

// Presenter -> ViewController
internal protocol GenericSubCategoriesViewProtocol: AnyObject {
    func reload()
    func setup(with subCategoryType: CategoryItemViewType)
}

// ViewController -> Presenter
internal protocol GenericSubCategoriesPresenterProtocol: UITableViewDelegate, UITableViewDataSource {
    func viewDidLoad()
}

// Presenter -> Repository
internal protocol GenericSubCategoriesRepositoryInputProtocol {
    
}

// Repository -> Presenter
internal protocol GenericSubCategoriesRepositoryOutputProtocol: AnyObject {
    
}
