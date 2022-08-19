import UIKit

internal class CardsCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension CardsCoordinator: CardsCoordinatorProtocol {
    func openCardDetails(using card: Card) {
        let viewController = CardDetailsCoordinator.createModule(navigationController: navigationController, card: card)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

extension CardsCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?, filterName: String, filterDetail: String, filterTitle: String) -> UIViewController {
        let repository = CardsRepository()

        let coordinator = CardsCoordinator(navigationController: navigationController)
        
        let presenter = CardsPresenter(
            repository: repository,
            coordinator: coordinator,
            filterName: filterName,
            filterDetail: filterDetail,
            filterTitle: filterTitle
        )
        
        repository.output = presenter

        let viewController = CardsViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
