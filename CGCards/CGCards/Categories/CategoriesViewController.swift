import UIKit

internal class CategoriesViewController: UIViewController, LoadingIndicatorViewType {
    var loadingIndicatorViewController: UIViewController?

    private let presenter: CategoriesPresenterProtocol
    
    lazy var categoriesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var setsCategoryView: CategoryItemView = {
        let view = CategoryItemView(type: .sets)
        view.delegate = self
        return view
    }()
    
    lazy var typesCategoryView: CategoryItemView = {
        let view = CategoryItemView(type: .types)
        view.delegate = self
        return view
    }()
    
    lazy var raritiesCategoryView: CategoryItemView = {
        let view = CategoryItemView(type: .rarities)
        view.delegate = self
        return view
    }()
    
    lazy var classesCategoryView: CategoryItemView = {
        let view = CategoryItemView(type: .classes)
        view.delegate = self
        return view
    }()
    
    lazy var spellSchoolsCategoryView: CategoryItemView = {
        let view = CategoryItemView(type: .spellSchools)
        view.delegate = self
        return view
    }()

    internal init(presenter: CategoriesPresenterProtocol) {
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

extension CategoriesViewController {
    func configViews() {
        view.backgroundColor = Colors.fundo()
    }
    
    func buildViews() {
        view.addSubview(categoriesStackView)
        
        categoriesStackView.addArrangedSubview(setsCategoryView)
        categoriesStackView.addArrangedSubview(typesCategoryView)
        categoriesStackView.addArrangedSubview(raritiesCategoryView)
        categoriesStackView.addArrangedSubview(classesCategoryView)
        categoriesStackView.addArrangedSubview(spellSchoolsCategoryView)
    }
    
    func buildConstraints() {
        categoriesStackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - CategoriesViewControllerProtocol
extension CategoriesViewController: CategoriesViewProtocol {

}

extension CategoriesViewController: CategoryItemViewDelegateProtocol {
    func touched(type: CategoryItemViewType) {
        switch type {
        case .sets:
            presenter.setsTouched()
        case .types:
            presenter.typesTouched()
        case .rarities:
            presenter.raritiesTouched()
        case .classes:
            presenter.classesTouched()
        case .spellSchools:
            presenter.spellSchoolsTouched()
        }
    }
    
}
