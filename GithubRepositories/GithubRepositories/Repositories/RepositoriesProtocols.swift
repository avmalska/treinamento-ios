import Foundation
import UIKit

// Presenter -> Coordinator
internal protocol RepositoriesCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol RepositoriesViewProtocol: AnyObject {
    func reload()
    func showAlert(title: String, message: String)
}

// ViewController -> Presenter
internal protocol RepositoriesPresenterProtocol: UITableViewDelegate, UITableViewDataSource {
    func viewDidLoad(language: String)
    func searchLanguage(language: String)
}

// Presenter -> Repository
internal protocol RepositoriesRepositoryInputProtocol {
    func getRepositories(language: String)
}

// Repository -> Presenter
internal protocol RepositoriesRepositoryOutputProtocol: AnyObject {
    func getRepositoriesSuccess(with repositories: [Repository])
    func getRepositoriesFailure(with error: APIError)
}
