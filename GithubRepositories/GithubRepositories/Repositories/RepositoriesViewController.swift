import UIKit
import SnapKit

internal class RepositoriesViewController: UIViewController {
    
    let inicialSelectedLanguage: ProgrammingLanguage = .swift
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        return tableView
    }()
    
    lazy var languagesScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var programmingLanguagesStackView: ProgrammingLanguagesStackView = {
        let stackView = ProgrammingLanguagesStackView(selectedLanguage: inicialSelectedLanguage)
        return stackView
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
        
        
        configViews()
        buildViews()
        buildConstraints()
        
        presenter.viewDidLoad(language: inicialSelectedLanguage.rawValue)
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
        title = Localizable.repositories()
        
        let barAppearance = UIBarAppearance()
        barAppearance.backgroundColor = Colors.navbar()

        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]

        let appearance = UINavigationBarAppearance(barAppearance: barAppearance)
        appearance.titleTextAttributes = textAttributes
        appearance.largeTitleTextAttributes = textAttributes
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = Colors.navbar()
        navigationController?.navigationBar.tintColor = Colors.navbar()
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        
        view.backgroundColor = .white
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.reuseIentifier.identifier)
    }
    
    func buildViews() {
        view.addSubview(tableView)
        view.addSubview(languagesScrollView)
        
        programmingLanguagesStackView.delegate = self
        languagesScrollView.addSubview(programmingLanguagesStackView)
        
    }
    
    func buildConstraints() {
        
        languagesScrollView.snp.makeConstraints { make in
            make.height.equalTo(66)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(tableView.snp.top)
        }
        
        programmingLanguagesStackView.snp.makeConstraints { make in
            make.bottom.trailing.leading.equalToSuperview()
            make.height.equalTo(35)
            make.top.equalToSuperview().offset(15)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(languagesScrollView.snp.bottom)
//            make.edges.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}


extension RepositoriesViewController: ProgrammingLanguagesStackViewDelegateProtocol {
    func touched(language: ProgrammingLanguage) {
        presenter.searchLanguage(language: language.rawValue)
    }
    
    
}
