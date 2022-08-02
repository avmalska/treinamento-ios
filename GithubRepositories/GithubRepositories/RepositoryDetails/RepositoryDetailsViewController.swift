import UIKit

internal class RepositoryDetailsViewController: UIViewController {

    private let presenter: RepositoryDetailsPresenterProtocol

    internal init(presenter: RepositoryDetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    lazy var programmingLanguageItemView: ProgrammingLanguageItemView = {
        let itemView = ProgrammingLanguageItemView(programmingLanguage: .swift, isSelected: true)
        return itemView
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tabBarController?.tabBar.isHidden = false
    }

}

extension RepositoryDetailsViewController {
    func configViews() {
        view.backgroundColor = .white
    }
    
    func buildViews() {
        
    }
    
    func buildConstraints() {
        
    }
}

// MARK: - RepositoryDetailsViewControllerProtocol
extension RepositoryDetailsViewController: RepositoryDetailsViewProtocol {
    func setup(with repositoryDetails: Repository) {
        print(repositoryDetails)
    }
    

}
