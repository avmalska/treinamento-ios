import Foundation

internal class CardDetailsRepository {

    internal weak var output: CardDetailsRepositoryOutputProtocol?

}

// MARK: - Repository Input
extension CardDetailsRepository: CardDetailsRepositoryInputProtocol {

}
