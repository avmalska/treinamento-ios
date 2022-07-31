import UIKit

internal class RepositoriesCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension RepositoriesCoordinator: RepositoriesCoordinatorProtocol {
    
}

extension RepositoriesCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?) -> UIViewController {
        let repository = RepositoriesRepository()

        let coordinator = RepositoriesCoordinator(navigationController: navigationController)
        
        let presenter = RepositoriesPresenter(
            repository: repository,
            coordinator: coordinator)
        
        repository.output = presenter

        let viewController = RepositoriesViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
