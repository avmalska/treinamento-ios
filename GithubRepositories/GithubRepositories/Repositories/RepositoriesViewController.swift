import UIKit
import SnapKit

internal class RepositoriesViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        return tableView
    }()

    private let presenter: RepositoriesPresenterProtocol

    internal init(presenter: RepositoriesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
    }

}

// MARK: - RepositoriesViewControllerProtocol
extension RepositoriesViewController: RepositoriesViewProtocol {
    func reload() {
        tableView.reloadData()
    }
    
    func showAlert(title: String, message: String) {
        
    }
    

}

extension RepositoriesViewController {
    func configViews() {
        title = "Repositories"
        view.backgroundColor = .white
        
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.reuseIentifier.identifier)
        
        view.addSubview(tableView)
    }
    
    func buildViews() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
    func buildConstraints() {
        
    }
}
