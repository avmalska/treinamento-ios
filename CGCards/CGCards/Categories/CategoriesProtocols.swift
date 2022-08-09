import Foundation

// Presenter -> Coordinator
internal protocol CategoriesCoordinatorProtocol {
    func openGenericSubcategory(genericSubCategories: [GenericSubCategory], subCategoryType: CategoryItemViewType)
}

// Presenter -> ViewController
internal protocol CategoriesViewProtocol: AnyObject {

}

// ViewController -> Presenter
internal protocol CategoriesPresenterProtocol {
    func viewDidLoad()
    func setsTouched()
    func typesTouched()
    func raritiesTouched()
    func classesTouched()
    func spellSchoolsTouched()
}

// Presenter -> Repository
internal protocol CategoriesRepositoryInputProtocol {
    func getMetadata()
}

// Repository -> Presenter
internal protocol CategoriesRepositoryOutputProtocol: AnyObject {
    func getMetadataSuccess(with metadata: Metadata)
    func getMetadataFailure(with error: APIError)
}
