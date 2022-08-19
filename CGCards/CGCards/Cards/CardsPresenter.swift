import Foundation
import UIKit

internal class CardsPresenter: NSObject {

    internal weak var view: CardsViewProtocol?
    internal var repository: CardsRepositoryInputProtocol
    internal var coordinator: CardsCoordinatorProtocol
    
    private let filterName: String
    private let filterDetail: String
    private let filterTitle: String
    private var totalPages: Int = 1
    private var cards: [Card] = []
    private var currentPage: Int = 1
    
    internal init(repository: CardsRepositoryInputProtocol,
                  coordinator: CardsCoordinatorProtocol,
                  filterName: String,
                  filterDetail: String,
                  filterTitle: String
    ) {
        self.repository = repository
        self.coordinator = coordinator
        self.filterName = filterName
        self.filterDetail = filterDetail
        self.filterTitle = filterTitle
    }
}

// MARK: - Presenter Protocol
extension CardsPresenter: CardsPresenterProtocol {
    func viewDidLoad() {
        view?.setup(name: filterTitle)
        
        repository.getCards(pageNumber: currentPage, filterName: filterName, filterDetail: filterDetail)
    }
    

}
// MARK: - Repository Output
extension CardsPresenter: CardsRepositoryOutputProtocol {
    func getCardsSuccess(with cardSearch: CardSearch) {
        if cardSearch.page == 1 {
            self.cards = cardSearch.cards
            self.totalPages = cardSearch.pageCount
            
            var filteredCards: [Card] = []
            
            for idx in 0...(cards.count-1) {
                if (filteredCards.first(where: {$0.name == cards[idx].name}) == nil) {
                    filteredCards.append(cards[idx])
                }
            }
            
            self.cards = filteredCards
        } else {
            var queryCards = cardSearch.cards

            var filteredCards: [Card] = []
            
            for idx in 0...(queryCards.count-1) {
                if (filteredCards.first(where: {$0.name == queryCards[idx].name}) == nil) {
                    filteredCards.append(queryCards[idx])
                }
            }
            
            queryCards = filteredCards
            self.cards.append(contentsOf: queryCards)
        }
        
        DispatchQueue.main.async {
            self.view?.reload()
        }
    }
    
    func getCardsFailure(with error: APIError) {

    }
}

extension CardsPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let card = cards[indexPath.row]
        
        coordinator.openCardDetails(using: card)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastIndex = self.cards.count - 1
        if indexPath.row == lastIndex, (self.currentPage + 1) <= totalPages {
            self.currentPage = self.currentPage + 1
            repository.getCards(pageNumber: currentPage, filterName: filterName, filterDetail: filterDetail)
        }
    }
}

extension CardsPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.reuseIentifier, for: indexPath)
        
        let card = cards[indexPath.row]
        
        cell!.setup(with: card)
        
        return cell!
    }
}


