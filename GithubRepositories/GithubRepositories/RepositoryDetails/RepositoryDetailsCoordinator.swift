import UIKit

internal class RepositoryDetailsCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RepositoryDetailsCoordinator: RepositoryDetailsCoordinatorProtocol {
    
}

extension RepositoryDetailsCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?, repositoryDetails: Repository) -> UIViewController {
        let repository = RepositoryDetailsRepository()

        let coordinator = RepositoryDetailsCoordinator(navigationController: navigationController)
        
        let presenter = RepositoryDetailsPresenter(
            repository: repository,
            coordinator: coordinator,
            repositoryDetails: repositoryDetails
        )
        
        repository.output = presenter

        let viewController = RepositoryDetailsViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
