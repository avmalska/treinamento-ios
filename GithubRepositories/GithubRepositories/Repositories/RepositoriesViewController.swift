import UIKit
import SnapKit

internal class RepositoriesViewController: UIViewController {
    
    var selectedLanguage: ProgrammingLanguage = .swift
    
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
    
    lazy var languagesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 18
//        stackView.distribution = .fillProportionally
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
        
        presenter.viewDidLoad(language: selectedLanguage.rawValue)
        update()
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
        view.backgroundColor = .white
        
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.reuseIentifier.identifier)
    }
    
    func buildViews() {
        view.addSubview(tableView)
        view.addSubview(languagesScrollView)
        
        languagesScrollView.addSubview(languagesStackView)
        
        for language in ProgrammingLanguage.allCases {
            let languageView = ProgrammingLanguageItemView(programmingLanguage: language)
            languageView.delegate = self
            languagesStackView.addArrangedSubview(languageView)
        }
        
    }
    
    func buildConstraints() {
        languagesScrollView.snp.makeConstraints { make in
            make.height.equalTo(66)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(tableView.snp.top)
        }
        
        languagesStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(35)
//            make.width.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(languagesScrollView.snp.bottom)
            make.trailing.leading.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func update() {
        for language in languagesStackView.arrangedSubviews {
            if let subLanguage = language as? ProgrammingLanguageItemView {
                if selectedLanguage == subLanguage.programmingLanguage {
                    subLanguage.isSelected = true
                    subLanguage.update()
                } else {
                    subLanguage.isSelected = false
                    subLanguage.update()
                }
            }
        }
    }
}

extension RepositoriesViewController: ProgrammingLanguageItemViewDelegateProtocol {
    func touched(language: ProgrammingLanguage) {
        if selectedLanguage != language {
            selectedLanguage = language
            presenter.searchLanguage(language: language.rawValue)
            update()
        }
    }
    
    
}
