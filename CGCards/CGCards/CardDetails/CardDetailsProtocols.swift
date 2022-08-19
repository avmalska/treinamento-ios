import Foundation

// Presenter -> Coordinator
internal protocol CardDetailsCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol CardDetailsViewProtocol: AnyObject {
    func setup(with card: Card)
}

// ViewController -> Presenter
internal protocol CardDetailsPresenterProtocol {
    func viewDidLoad()
}

// Presenter -> Repository
internal protocol CardDetailsRepositoryInputProtocol {
    
}

// Repository -> Presenter
internal protocol CardDetailsRepositoryOutputProtocol: AnyObject {
    
}
