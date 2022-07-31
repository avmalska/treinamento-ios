import UIKit

internal class CoffeeDetailsViewController: UIViewController, LoadingIndicatorViewType {
    var loadingIndicatorViewController: UIViewController?

    private let presenter: CoffeeDetailsPresenterProtocol
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var capsuleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var intensityView: CoffeeIntensity = {
        let view = CoffeeIntensity()
        return view
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var garbageLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansLight(size: 100)
        label.numberOfLines = 0
        return label
    }()

    internal init(presenter: CoffeeDetailsPresenterProtocol) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setupFavoritesButton() {
        let image = UIImage(systemName: "heart")
        
        let buttonItem = UIBarButtonItem(
            image: image,
            style: .plain,
            target: self,
            action: #selector(addToFavoritesTouched)
        )
        
        navigationItem.rightBarButtonItems = [buttonItem]
    }
    
    private func createPriceText(using price: Double) -> NSMutableAttributedString {
        var priceText = Localizable.tenCapsules().withStyle(Fonts.openSansLight(size: 12)!, Colors.textoCinzaDiscreto()!)
        priceText += price.asMoney.withStyle(Fonts.openSansLight(size: 20)!, .black)
        return priceText
    }
    
    @objc func addToFavoritesTouched() {
        //
    }

}

extension CoffeeDetailsViewController {
    
    func configViews() {
        setupFavoritesButton()
        
        view.backgroundColor = .white
    }
    
    func buildViews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(capsuleImageView)
        contentView.addSubview(intensityView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(garbageLabel)
    }
    
    func buildConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        capsuleImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(44)
            make.centerX.equalToSuperview()
            make.height.equalTo(150)
        }
        
        intensityView.snp.makeConstraints { make in
            make.top.equalTo(capsuleImageView.snp.bottom).offset(38)
            make.leading.equalToSuperview().offset(18)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(capsuleImageView.snp.bottom).offset(38)
            make.trailing.equalToSuperview().inset(18)
        }
        
        garbageLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}

// MARK: - CoffeeDetailsViewControllerProtocol
extension CoffeeDetailsViewController: CoffeeDetailsViewProtocol {
    
    func setup(with coffeeDetails: CoffeeDetails) {
        DispatchQueue.main.async {
            self.capsuleImageView.loadImage(from: coffeeDetails.image)
            self.intensityView.setup(intensity: coffeeDetails.intensity ?? 0)
            self.priceLabel.attributedText = self.createPriceText(using: coffeeDetails.price)
            self.garbageLabel.text = "AAAAAAAAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBBBBBB"
        }
    }
    
    func setup(name: String) {
        title = name
    }

}
