import Foundation

// Presenter -> Coordinator
internal protocol CustomCardsCoordinatorProtocol {
    func openCustomCards()
    func createCustomCard()
}

// Presenter -> ViewController
internal protocol CustomCardsViewProtocol: AnyObject {

}

// ViewController -> Presenter
internal protocol CustomCardsPresenterProtocol {
    func viewCustomCardsTouched()
    func createCustomCardTouched()
}

// Presenter -> Repository
internal protocol CustomCardsRepositoryInputProtocol {
    
}

// Repository -> Presenter
internal protocol CustomCardsRepositoryOutputProtocol: AnyObject {
    
}
