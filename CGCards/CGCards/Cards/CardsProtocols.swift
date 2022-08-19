import Foundation
import UIKit

// Presenter -> Coordinator
internal protocol CardsCoordinatorProtocol {
    func openCardDetails(using card: Card)
}

// Presenter -> ViewController
internal protocol CardsViewProtocol: AnyObject {
    func setup(name: String)
    func reload()
}

// ViewController -> Presenter
internal protocol CardsPresenterProtocol: UITableViewDelegate, UITableViewDataSource {
    func viewDidLoad()
}

// Presenter -> Repository
internal protocol CardsRepositoryInputProtocol {
    func getCards(
        pageNumber: Int?,
        filterName: String,
        filterDetail: String
    )
    
}

// Repository -> Presenter
internal protocol CardsRepositoryOutputProtocol: AnyObject {
    func getCardsSuccess(with cardSearch: CardSearch)
    func getCardsFailure(with error: APIError)
}
