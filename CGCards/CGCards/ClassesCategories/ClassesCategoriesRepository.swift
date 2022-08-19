import Foundation

internal class ClassesCategoriesRepository {

    internal weak var output: ClassesCategoriesRepositoryOutputProtocol?
    private let api = API()

}

// MARK: - Repository Input
extension ClassesCategoriesRepository: ClassesCategoriesRepositoryInputProtocol {
    func getClassCard(with id: Int, for pos: Int) {
        api.request(endpoint: .cardDetail(id: id)) { [weak self] (card: Card) in
            self?.output?.getClassCardSucess(with: card, for: pos)
        } failure: { [weak self] error in
            self?.output?.getClassCardFailure(with: error)
        }
    }
    
}
