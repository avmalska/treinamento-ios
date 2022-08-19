import Foundation

internal class CreateCustomCardPresenter {

    internal weak var view: CreateCustomCardViewProtocol?
    internal var repository: CreateCustomCardRepositoryInputProtocol
    internal var coordinator: CreateCustomCardCoordinatorProtocol
    
    internal init(repository: CreateCustomCardRepositoryInputProtocol,
                  coordinator: CreateCustomCardCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension CreateCustomCardPresenter: CreateCustomCardPresenterProtocol {

}
// MARK: - Repository Output
extension CreateCustomCardPresenter: CreateCustomCardRepositoryOutputProtocol {
    
}
