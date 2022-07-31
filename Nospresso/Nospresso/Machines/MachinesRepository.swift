import Foundation

internal class MachinesRepository {

    internal weak var output: MachinesRepositoryOutputProtocol?
    let api = API()

}

// MARK: - Repository Input
extension MachinesRepository: MachinesRepositoryInputProtocol {
    
    func getMachines() {
        api.request(endpoint: .machines) { [weak self] (machines: [Machine]) in
            self?.output?.getMachinesSuccess(with: machines)
        } failure: { [weak self] error in
            self?.output?.getMachinesFailure(with: error)
        }
    }
    
}
