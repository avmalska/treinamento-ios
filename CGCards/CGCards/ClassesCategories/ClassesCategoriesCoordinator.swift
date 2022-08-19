import UIKit

internal class ClassesCategoriesCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension ClassesCategoriesCoordinator: ClassesCategoriesCoordinatorProtocol {
    func openCardSearch(filterName: String, filterDetail: String, filterTitle: String) {
        let viewController = CardsCoordinator.createModule(navigationController: navigationController, filterName: filterName, filterDetail: filterDetail, filterTitle: filterTitle)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ClassesCategoriesCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?, classesCategories: [ClassCategory], subCategoryType: CategoryItemViewType) -> UIViewController {
        let repository = ClassesCategoriesRepository()

        let coordinator = ClassesCategoriesCoordinator(navigationController: navigationController)
        
        let presenter = ClassesCategoriesPresenter(
            repository: repository,
            coordinator: coordinator,
            classesCategories: classesCategories,
            subCategoryType: subCategoryType
        )
        
        repository.output = presenter

        let viewController = ClassesCategoriesViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
