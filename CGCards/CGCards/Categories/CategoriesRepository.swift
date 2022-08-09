import Foundation

internal class CategoriesRepository {

    internal weak var output: CategoriesRepositoryOutputProtocol?
    let api = API()

}

// MARK: - Repository Input
extension CategoriesRepository: CategoriesRepositoryInputProtocol {
    func getMetadata() {
        api.request(endpoint: .metadata) { [weak self] (metadata: Metadata) in
            self?.output?.getMetadataSuccess(with: metadata)
        } failure: { [weak self] error in
            self?.output?.getMetadataFailure(with: error)
        }
    }

}
