import UIKit

internal class ClassesCategoriesViewController: UIViewController {

    private let presenter: ClassesCategoriesPresenterProtocol
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = Colors.fundo()
        return view
    }()

    internal init(presenter: ClassesCategoriesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
        
        
    }

}

extension ClassesCategoriesViewController {
    func configViews() {
        collectionView.delegate = self
        collectionView.dataSource = presenter
        collectionView.register(ClassCategoryViewCell.self, forCellWithReuseIdentifier: ClassCategoryViewCell.reuseIdentifier.identifier)
        
        view.backgroundColor = .secondarySystemBackground
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

extension ClassesCategoriesViewController: UICollectionViewDelegateFlowLayout {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let classIndex = indexPath.item
        self.presenter.openCards(classIndex: classIndex)
    }
}

enum CollectionViewLayoutConstants {
    static let horizontalSpacing: CGFloat = 10
    static let verticalSpacing: CGFloat = 10
    
    static func cellSize(basedOn collectionViewWidth:CGFloat) -> CGSize {
        let width = collectionViewWidth - (CollectionViewLayoutConstants.horizontalSpacing * 3)
        return .init(
            width: width/2,
            height: 260
        )
    }
}

// MARK: - ClassesCategoriesViewControllerProtocol
extension ClassesCategoriesViewController: ClassesCategoriesViewProtocol {
    func setup(with subCategoryType: CategoryItemViewType) {
        title = subCategoryType.title
    }
    func reload() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

}
