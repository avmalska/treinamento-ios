import Foundation
import UIKit

internal class RepositoriesPresenter: NSObject {

    internal weak var view: RepositoriesViewProtocol?
    internal var repository: RepositoriesRepositoryInputProtocol
    internal var coordinator: RepositoriesCoordinatorProtocol
    
    private var repositories: [Repository] = []
    
    internal init(repository: RepositoriesRepositoryInputProtocol,
                  coordinator: RepositoriesCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension RepositoriesPresenter: RepositoriesPresenterProtocol {
    func viewDidLoad() {
        repository.getRepositories()
    }
    
    

}
// MARK: - Repository Output
extension RepositoriesPresenter: RepositoriesRepositoryOutputProtocol {
    func getRepositoriesSuccess(with repositories: [Repository]) {
        self.repositories = repositories
        
        DispatchQueue.main.async {
            self.view?.reload()
        }
    }
    
    func getRepositoriesFailure(with error: APIError) {
        DispatchQueue.main.async {
            self.view?.showAlert(title: "Erro", message: "deu erro")
        }
    }
    
}

extension RepositoriesPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension RepositoriesPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.reuseIentifier, for: indexPath)!
        
        let repository = repositories[indexPath.row]
        
        cell.setup(with: repository)
        
        return cell
    }
    
    
}
