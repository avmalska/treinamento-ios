import UIKit

internal class GenericSubCategoriesViewController: UIViewController {

    private let presenter: GenericSubCategoriesPresenterProtocol
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        return tableView
    }()

    internal init(presenter: GenericSubCategoriesPresenterProtocol) {
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

extension GenericSubCategoriesViewController {
    func configViews() {
        view.backgroundColor = Colors.fundo()
        
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(GenericSubCategoryTableViewCell.self, forCellReuseIdentifier: GenericSubCategoryTableViewCell.reuseIentifier.identifier)
    }
    
    func buildViews() {
        view.addSubview(tableView)
    }
    
    func buildConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - GenericSubCategoriesViewControllerProtocol
extension GenericSubCategoriesViewController: GenericSubCategoriesViewProtocol {
    func setup(with subCategoryType: CategoryItemViewType) {
        title = subCategoryType.title
    }
    
    func reload() {
        tableView.reloadData()
    }

}
