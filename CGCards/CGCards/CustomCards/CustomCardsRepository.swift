import Foundation

internal class CustomCardsRepository {

    internal weak var output: CustomCardsRepositoryOutputProtocol?

}

// MARK: - Repository Input
extension CustomCardsRepository: CustomCardsRepositoryInputProtocol {

}
