import Foundation

internal class CustomCardsPresenter {

    internal weak var view: CustomCardsViewProtocol?
    internal var repository: CustomCardsRepositoryInputProtocol
    internal var coordinator: CustomCardsCoordinatorProtocol
    
    internal init(repository: CustomCardsRepositoryInputProtocol,
                  coordinator: CustomCardsCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension CustomCardsPresenter: CustomCardsPresenterProtocol {
    func viewCustomCardsTouched() {
        coordinator.openCustomCards()
    }
    
    func createCustomCardTouched() {
        coordinator.createCustomCard()
    }
    

}
// MARK: - Repository Output
extension CustomCardsPresenter: CustomCardsRepositoryOutputProtocol {
    
}
