import UIKit

internal class CategoriesCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension CategoriesCoordinator: CategoriesCoordinatorProtocol {
    func openGenericSubcategory(genericSubCategories: [GenericSubCategory], subCategoryType: CategoryItemViewType) {
        let viewController = GenericSubCategoriesCoordinator.createModule(navigationController: navigationController, subCategories: genericSubCategories, subCategoryType: subCategoryType)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension CategoriesCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?) -> UIViewController {
        let repository = CategoriesRepository()

        let coordinator = CategoriesCoordinator(navigationController: navigationController)
        
        let presenter = CategoriesPresenter(
            repository: repository,
            coordinator: coordinator)
        
        repository.output = presenter

        let viewController = CategoriesViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
