import UIKit

internal class CreateCustomCardCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension CreateCustomCardCoordinator: CreateCustomCardCoordinatorProtocol {
    
}

extension CreateCustomCardCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?) -> UIViewController {
        let repository = CreateCustomCardRepository()

        let coordinator = CreateCustomCardCoordinator(navigationController: navigationController)
        
        let presenter = CreateCustomCardPresenter(
            repository: repository,
            coordinator: coordinator)
        
        repository.output = presenter

        let viewController = CreateCustomCardViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
