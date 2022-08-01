import Foundation

internal class RepositoriesRepository {

    internal weak var output: RepositoriesRepositoryOutputProtocol?
    
}

// MARK: - Repository Input
extension RepositoriesRepository: RepositoriesRepositoryInputProtocol {
    func getRepositories(language: String) {
        
        Requester.request(search: .init(endpoint: .search(language: language))) { [weak self] (result: Result<RepositorySearch, APIError>) in
            switch result {
            case .success(let repositorySearch):
                self?.output?.getRepositoriesSuccess(with: repositorySearch.repositories)
            case .failure(let error):
                print(error)
            }
        }
    }
    

}
