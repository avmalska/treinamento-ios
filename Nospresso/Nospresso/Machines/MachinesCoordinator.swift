import UIKit

internal class MachinesCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension MachinesCoordinator: MachinesCoordinatorProtocol {
    
}

extension MachinesCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?) -> UIViewController {
        let repository = MachinesRepository()

        let coordinator = MachinesCoordinator(navigationController: navigationController)
        
        let presenter = MachinesPresenter(
            repository: repository,
            coordinator: coordinator)
        
        repository.output = presenter

        let viewController = MachinesViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
