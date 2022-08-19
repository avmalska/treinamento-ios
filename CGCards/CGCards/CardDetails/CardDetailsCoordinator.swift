import UIKit

internal class CardDetailsCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension CardDetailsCoordinator: CardDetailsCoordinatorProtocol {
    
}

extension CardDetailsCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?, card: Card) -> UIViewController {
        let repository = CardDetailsRepository()

        let coordinator = CardDetailsCoordinator(navigationController: navigationController)
        
        let presenter = CardDetailsPresenter(
            repository: repository,
            coordinator: coordinator,
            card: card
        )
        
        repository.output = presenter

        let viewController = CardDetailsViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
