import UIKit
import SnapKit

internal class CardDetailsViewController: UIViewController {

    private let presenter: CardDetailsPresenterProtocol
    
    private var imgGold: String = ""
    private var imgNormal: String = ""
    private var isGoldDisplayed: Bool = false
    
    lazy var cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var flavorTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .italicSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    lazy var goldButton: UIButton = {
        let button = UIButton()
        button.setTitle("See Gold", for: .normal)
        button.setTitleColor(UIColor.black , for: .normal)
        button.addTarget(self, action: #selector(goldButtonTouched), for: .touchDown)
        return button
    }()

    internal init(presenter: CardDetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    @objc func goldButtonTouched() {
        if !isGoldDisplayed {
            cardImageView.loadImage(from: imgGold)
            goldButton.setTitle("See Normal", for: .normal)
            isGoldDisplayed = true
        } else {
            cardImageView.loadImage(from: imgNormal)
            goldButton.setTitle("See Gold", for: .normal)
            isGoldDisplayed = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
        
        presenter.viewDidLoad()
    }

}

extension CardDetailsViewController {
    func configViews() {
        view.backgroundColor = Colors.fundo()
    }
    
    func buildViews() {
        view.addSubview(cardImageView)
        view.addSubview(goldButton)
        view.addSubview(flavorTextLabel)
        view.addSubview(authorLabel)
    }
    
    func buildConstraints() {
        cardImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            make.height.equalTo(465)
            make.trailing.leading.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        goldButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            make.trailing.equalToSuperview().inset(10)
        }
        
        flavorTextLabel.snp.makeConstraints { make in
            make.top.equalTo(cardImageView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().inset(5)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(flavorTextLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }

    }
}

// MARK: - CardDetailsViewControllerProtocol
extension CardDetailsViewController: CardDetailsViewProtocol {
    func setup(with card: Card) {
        DispatchQueue.main.async {
            self.cardImageView.loadImage(from: card.image)
            self.flavorTextLabel.text = "'" + card.flavorText + "'"
            self.authorLabel.text = "Art By: " + card.artistName
            self.imgGold = card.imageGold
            if self.imgGold == "" {
                self.goldButton.isHidden = true
            }
            self.imgNormal = card.image
            self.title = card.name
        }
    }
    

}
