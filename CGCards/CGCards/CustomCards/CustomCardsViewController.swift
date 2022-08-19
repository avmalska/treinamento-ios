import UIKit

internal class CustomCardsViewController: UIViewController {

    private let presenter: CustomCardsPresenterProtocol
    
    lazy var optionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var createCustomCardView: CustomCardsItemView = {
        let view = CustomCardsItemView(type: .createCustomCard)
        view.delegate = self
        return view
    }()

    lazy var viewCustomCardsView: CustomCardsItemView = {
        let view = CustomCardsItemView(type: .viewCustomCards)
        view.delegate = self
        return view
    }()
    
    internal init(presenter: CustomCardsPresenterProtocol) {
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
    }

}

extension CustomCardsViewController {
    func configViews() {
        view.backgroundColor = Colors.fundo()
    }
    
    func buildViews() {
        view.addSubview(optionsStackView)
        
        optionsStackView.addArrangedSubview(createCustomCardView)
        optionsStackView.addArrangedSubview(viewCustomCardsView)
    }
    
    func buildConstraints() {
        optionsStackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
}

extension CustomCardsViewController: CustomCardsItemViewDelegateProtocol {
    func touched(type: CustomCardsItemViewType) {
        switch type {
        case.createCustomCard:
            presenter.createCustomCardTouched()
        case .viewCustomCards:
            presenter.viewCustomCardsTouched()
        }
    }
    
    
}

// MARK: - CustomCardsViewControllerProtocol
extension CustomCardsViewController: CustomCardsViewProtocol {

}
