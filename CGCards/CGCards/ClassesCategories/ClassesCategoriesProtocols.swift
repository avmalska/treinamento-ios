import Foundation
import UIKit

// Presenter -> Coordinator
internal protocol ClassesCategoriesCoordinatorProtocol {
    func openCardSearch(filterName: String, filterDetail: String, filterTitle: String)
}

// Presenter -> ViewController
internal protocol ClassesCategoriesViewProtocol: AnyObject {
    func reload()
    func setup(with subCategoryType: CategoryItemViewType)
}

// ViewController -> Presenter
internal protocol ClassesCategoriesPresenterProtocol: UICollectionViewDataSource {
    func viewDidLoad()
    func openCards(classIndex: Int)
}

// Presenter -> Repository
internal protocol ClassesCategoriesRepositoryInputProtocol {
    func getClassCard(with id: Int, for pos: Int)
}

// Repository -> Presenter
internal protocol ClassesCategoriesRepositoryOutputProtocol: AnyObject {
    func getClassCardSucess(with card: Card, for pos: Int)
    func getClassCardFailure(with error: APIError)
}
