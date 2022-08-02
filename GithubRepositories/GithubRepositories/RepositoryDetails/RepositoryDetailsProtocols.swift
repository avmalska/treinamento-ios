import Foundation

// Presenter -> Coordinator
internal protocol RepositoryDetailsCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol RepositoryDetailsViewProtocol: AnyObject {
    func setup(with repositoryDetails: Repository)
}

// ViewController -> Presenter
internal protocol RepositoryDetailsPresenterProtocol {
    func viewDidLoad()
}

// Presenter -> Repository
internal protocol RepositoryDetailsRepositoryInputProtocol {
}

// Repository -> Presenter
internal protocol RepositoryDetailsRepositoryOutputProtocol: AnyObject {
    
}
