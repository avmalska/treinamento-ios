import Foundation
import UIKit

internal class GenericSubCategoriesPresenter: NSObject {

    internal weak var view: GenericSubCategoriesViewProtocol?
    internal var repository: GenericSubCategoriesRepositoryInputProtocol
    internal var coordinator: GenericSubCategoriesCoordinatorProtocol
    
    private let subCategories: [GenericSubCategory]
    private let subCategoryType: CategoryItemViewType
    
    internal init(repository: GenericSubCategoriesRepositoryInputProtocol,
                  coordinator: GenericSubCategoriesCoordinatorProtocol,
                  subCategories: [GenericSubCategory],
                  subCategoryType: CategoryItemViewType
    ) {
        self.repository = repository
        self.coordinator = coordinator
        self.subCategories = subCategories
        self.subCategoryType = subCategoryType
    }
}

// MARK: - Presenter Protocol
extension GenericSubCategoriesPresenter: GenericSubCategoriesPresenterProtocol {
    func viewDidLoad() {
        view?.setup(with: subCategoryType)
        DispatchQueue.main.async {
            self.view?.reload()
        }
    }
    

}
// MARK: - Repository Output
extension GenericSubCategoriesPresenter: GenericSubCategoriesRepositoryOutputProtocol {
    
}

extension GenericSubCategoriesPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension GenericSubCategoriesPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        subCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericSubCategoryTableViewCell.reuseIentifier, for: indexPath)!
        
        let subCategory = subCategories[indexPath.row]
        
        cell.setup(with: subCategory)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filterName = subCategoryType.rawValue
        let filterDetail = subCategories[indexPath.row].slug
        let filterTitle = subCategories[indexPath.row].name
        coordinator.openCardSearch(filterName: filterName, filterDetail: filterDetail, filterTitle: filterTitle)
    }
    
}

