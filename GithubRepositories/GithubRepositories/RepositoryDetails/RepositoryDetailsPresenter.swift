import Foundation

internal class RepositoryDetailsPresenter {

    internal weak var view: RepositoryDetailsViewProtocol?
    internal var repository: RepositoryDetailsRepositoryInputProtocol
    internal var coordinator: RepositoryDetailsCoordinatorProtocol
    
    private let repositoryDetails: Repository
    
    internal init(repository: RepositoryDetailsRepositoryInputProtocol,
                  coordinator: RepositoryDetailsCoordinatorProtocol,
                  repositoryDetails: Repository
    ) {
        self.repository = repository
        self.coordinator = coordinator
        self.repositoryDetails = repositoryDetails
    }
}

// MARK: - Presenter Protocol
extension RepositoryDetailsPresenter: RepositoryDetailsPresenterProtocol {
    func viewDidLoad() {
        view?.setup(with: repositoryDetails)
    }
    

}
// MARK: - Repository Output
extension RepositoryDetailsPresenter: RepositoryDetailsRepositoryOutputProtocol {
    
}
