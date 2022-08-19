import UIKit

internal class CardsViewController: UIViewController {

    private let presenter: CardsPresenterProtocol
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        return tableView
    }()

    internal init(presenter: CardsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
        
        presenter.viewDidLoad()
    }

}

extension CardsViewController {
    func configViews() {
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(CardTableViewCell.self, forCellReuseIdentifier: CardTableViewCell.reuseIentifier.identifier)
        
        view.backgroundColor = Colors.fundo()
    }
    
    func buildViews() {
        view.addSubview(tableView)
    }
    
    func buildConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
}

// MARK: - CardsViewControllerProtocol
extension CardsViewController: CardsViewProtocol {
    func setup(name: String) {
        title = name
    }
    
    func reload() {
        tableView.reloadData()
    }
}
