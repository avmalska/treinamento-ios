import Foundation

internal class CategoriesPresenter {

    internal weak var view: CategoriesViewProtocol?
    internal var repository: CategoriesRepositoryInputProtocol
    internal var coordinator: CategoriesCoordinatorProtocol
    
    internal var metadata: Metadata?
    
    internal init(repository: CategoriesRepositoryInputProtocol,
                  coordinator: CategoriesCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension CategoriesPresenter: CategoriesPresenterProtocol {
    func setsTouched() {
        var genericSubCategories: [GenericSubCategory] = []
        
        metadata?.sets.forEach({ value in
            let genericSub = GenericSubCategory(id: value.id, name: value.name, slug: value.slug)
            genericSubCategories.append(genericSub)
        })
        
        coordinator.openGenericSubcategory(genericSubCategories: genericSubCategories, subCategoryType: .sets)
    }
    
    func typesTouched() {
        var genericSubCategories: [GenericSubCategory] = []
        
        metadata?.types.forEach({ value in
            let genericSub = GenericSubCategory(id: value.id, name: value.name, slug: value.slug)
            genericSubCategories.append(genericSub)
        })
        
        coordinator.openGenericSubcategory(genericSubCategories: genericSubCategories, subCategoryType: .types)
    }
    
    func raritiesTouched() {
        var genericSubCategories: [GenericSubCategory] = []
        
        metadata?.rarities.forEach({ value in
            let genericSub = GenericSubCategory(id: value.id, name: value.name, slug: value.slug)
            genericSubCategories.append(genericSub)
        })
        
        coordinator.openGenericSubcategory(genericSubCategories: genericSubCategories, subCategoryType: .rarities)
    }
    
    func classesTouched() {
        
    }
    
    func spellSchoolsTouched() {
        var genericSubCategories: [GenericSubCategory] = []
        
        metadata?.spellSchools.forEach({ value in
            let genericSub = GenericSubCategory(id: value.id, name: value.name, slug: value.slug)
            genericSubCategories.append(genericSub)
        })
        
        coordinator.openGenericSubcategory(genericSubCategories: genericSubCategories, subCategoryType: .spellSchools)
    }
    
    func viewDidLoad() {
        repository.getMetadata()
    }

}
// MARK: - Repository Output
extension CategoriesPresenter: CategoriesRepositoryOutputProtocol {
    func getMetadataSuccess(with metadata: Metadata) {
        self.metadata = metadata
    }
    
    func getMetadataFailure(with error: APIError) {
        print("erro")
    }
    
    
}
