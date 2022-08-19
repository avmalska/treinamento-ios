import Foundation

internal class CardDetailsPresenter {

    internal weak var view: CardDetailsViewProtocol?
    internal var repository: CardDetailsRepositoryInputProtocol
    internal var coordinator: CardDetailsCoordinatorProtocol
    
    private let card: Card
    
    internal init(repository: CardDetailsRepositoryInputProtocol,
                  coordinator: CardDetailsCoordinatorProtocol,
                  card: Card
    ) {
        self.repository = repository
        self.coordinator = coordinator
        self.card = card
    }
}

// MARK: - Presenter Protocol
extension CardDetailsPresenter: CardDetailsPresenterProtocol {
    func viewDidLoad() {
        view?.setup(with: card)
    }
    

}
// MARK: - Repository Output
extension CardDetailsPresenter: CardDetailsRepositoryOutputProtocol {
    
}
