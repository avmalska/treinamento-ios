import UIKit

internal class GenericSubCategoriesCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension GenericSubCategoriesCoordinator: GenericSubCategoriesCoordinatorProtocol {
    func openCardSearch(filterName: String, filterDetail: String, filterTitle: String) {
        let viewController = CardsCoordinator.createModule(navigationController: navigationController, filterName: filterName, filterDetail: filterDetail, filterTitle: filterTitle)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

extension GenericSubCategoriesCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?, subCategories: [GenericSubCategory], subCategoryType: CategoryItemViewType) -> UIViewController {
        let repository = GenericSubCategoriesRepository()

        let coordinator = GenericSubCategoriesCoordinator(navigationController: navigationController)
        
        let presenter = GenericSubCategoriesPresenter(
            repository: repository,
            coordinator: coordinator,
            subCategories: subCategories,
            subCategoryType: subCategoryType
        )
        
        repository.output = presenter

        let viewController = GenericSubCategoriesViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
