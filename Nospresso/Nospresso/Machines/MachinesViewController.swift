import UIKit

internal class MachinesViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = Colors.fundoCinza()
        return view
    }()

    private let presenter: MachinesPresenterProtocol

    internal init(presenter: MachinesPresenterProtocol) {
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
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}

extension MachinesViewController {
    
    func configViews() {
        collectionView.delegate = self
        collectionView.dataSource = presenter
        collectionView.register(MachineViewCell.self, forCellWithReuseIdentifier: MachineViewCell.reuseIdentifier.identifier)
        
        title = Localizable.machines()
        view.backgroundColor = Colors.maquinas()
    }
    
    func buildViews() {
        view.addSubview(collectionView)
    }
    
    func buildConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

// MARK: - MachinesViewControllerProtocol
extension MachinesViewController: MachinesViewProtocol {
    
    func reload() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension MachinesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CollectionViewLayoutConstants.cellSize(basedOn: collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(
            top: CollectionViewLayoutConstants.verticalSpacing,
            left: CollectionViewLayoutConstants.horizontalSpacing,
            bottom: CollectionViewLayoutConstants.verticalSpacing,
            right: CollectionViewLayoutConstants.horizontalSpacing
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CollectionViewLayoutConstants.horizontalSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CollectionViewLayoutConstants.verticalSpacing
    }
    
}

enum CollectionViewLayoutConstants {
    static let horizontalSpacing: CGFloat = 16
    static let verticalSpacing: CGFloat = 20
    
    static func cellSize(basedOn collectionViewWidth:CGFloat) -> CGSize {
        let width = collectionViewWidth - (CollectionViewLayoutConstants.horizontalSpacing * 3)
        return .init(
            width: width/2,
            height: 260
        )
    }
}
