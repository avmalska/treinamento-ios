import Foundation

internal class CardsRepository {

    internal weak var output: CardsRepositoryOutputProtocol?
    let api = API()

}

// MARK: - Repository Input
extension CardsRepository: CardsRepositoryInputProtocol {
    func getCards(pageNumber: Int? = 1, filterName: String, filterDetail: String) {
        api.request(endpoint: .cardSearch, pageNumber: pageNumber, filterName: filterName, filterDetail: filterDetail) { [weak self] (cardSearch: CardSearch) in
            self?.output?.getCardsSuccess(with: cardSearch)
        } failure: { [weak self] error in
            self?.output?.getCardsFailure(with: error)
        }
    }
    

}
