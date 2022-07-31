import Foundation
import UIKit

internal class MachinesPresenter: NSObject {

    internal weak var view: MachinesViewProtocol?
    internal var repository: MachinesRepositoryInputProtocol
    internal var coordinator: MachinesCoordinatorProtocol
    
    var machines: [Machine] = []
    
    internal init(repository: MachinesRepositoryInputProtocol,
                  coordinator: MachinesCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension MachinesPresenter: MachinesPresenterProtocol {
    
    func viewDidLoad() {
        repository.getMachines()
    }

}

// MARK: - Repository Output
extension MachinesPresenter: MachinesRepositoryOutputProtocol {
    
    func getMachinesSuccess(with machines: [Machine]) {
        self.machines = machines
        view?.reload()
    }
    
    func getMachinesFailure(with error: APIError) {
        // TODO: SHOW ERROR
    }
    
}

extension MachinesPresenter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        machines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MachineViewCell.reuseIdentifier, for: indexPath)!
        
        cell.setup(with: machines[indexPath.item])
        
        return cell
    }
}
