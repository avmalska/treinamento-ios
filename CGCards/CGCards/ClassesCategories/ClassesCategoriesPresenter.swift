import Foundation
import UIKit

internal class ClassesCategoriesPresenter: NSObject {

    internal weak var view: ClassesCategoriesViewProtocol?
    internal var repository: ClassesCategoriesRepositoryInputProtocol
    internal var coordinator: ClassesCategoriesCoordinatorProtocol
    
    private var classesCategories: [ClassCategory]
    private let subCategoryType: CategoryItemViewType
    
    internal init(repository: ClassesCategoriesRepositoryInputProtocol,
                  coordinator: ClassesCategoriesCoordinatorProtocol,
                  classesCategories: [ClassCategory],
                  subCategoryType: CategoryItemViewType
    ) {
        self.repository = repository
        self.coordinator = coordinator
        self.classesCategories = classesCategories
        self.subCategoryType = subCategoryType
    }
}

// MARK: - Presenter Protocol
extension ClassesCategoriesPresenter: ClassesCategoriesPresenterProtocol {
    func openCards(classIndex: Int) {
        let filterName = subCategoryType.rawValue
        let filterDetail = classesCategories[classIndex].slug
        let filterTitle = classesCategories[classIndex].name
        coordinator.openCardSearch(filterName: filterName, filterDetail: filterDetail, filterTitle: filterTitle)
    }
    
    func viewDidLoad() {
        view?.setup(with: subCategoryType)
        for (index, classCategory) in classesCategories.enumerated() {
            if let cardId = classCategory.cardId {
                repository.getClassCard(with: cardId, for: index)
            }
        }
    }
    
    

}
// MARK: - Repository Output
extension ClassesCategoriesPresenter: ClassesCategoriesRepositoryOutputProtocol {
    func getClassCardSucess(with card: Card, for pos: Int) {
        self.classesCategories[pos].cardImg = card.image
        DispatchQueue.main.async {
            self.view?.reload()
        }
    }
    func getClassCardFailure(with error: APIError) {

    }
}

extension ClassesCategoriesPresenter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        classesCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClassCategoryViewCell.reuseIdentifier, for: indexPath)!
        
        cell.setup(with: classesCategories[indexPath.item])
        
        return cell
    }

}
