import Foundation
import UIKit

// Presenter -> Coordinator
internal protocol MachinesCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol MachinesViewProtocol: AnyObject {
    func reload()
}

// ViewController -> Presenter
internal protocol MachinesPresenterProtocol: UICollectionViewDataSource {
    func viewDidLoad()
}

// Presenter -> Repository
internal protocol MachinesRepositoryInputProtocol {
    func getMachines()
}

// Repository -> Presenter
internal protocol MachinesRepositoryOutputProtocol: AnyObject {
    func getMachinesSuccess(with machines: [Machine])
    func getMachinesFailure(with error: APIError)
}
