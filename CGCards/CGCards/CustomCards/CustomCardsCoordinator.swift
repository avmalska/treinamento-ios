import UIKit

internal class CustomCardsCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension CustomCardsCoordinator: CustomCardsCoordinatorProtocol {
    func createCustomCard() {
        let viewController = CreateCustomCardCoordinator.createModule(navigationController: navigationController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    func openCustomCards() {

    }
}

extension CustomCardsCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?) -> UIViewController {
        let repository = CustomCardsRepository()

        let coordinator = CustomCardsCoordinator(navigationController: navigationController)
        
        let presenter = CustomCardsPresenter(
            repository: repository,
            coordinator: coordinator)
        
        repository.output = presenter

        let viewController = CustomCardsViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
