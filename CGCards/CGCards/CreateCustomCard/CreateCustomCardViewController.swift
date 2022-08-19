import UIKit

internal class CreateCustomCardViewController: UIViewController {

    private let presenter: CreateCustomCardPresenterProtocol
    
    lazy var printView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var templateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.card_template()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 90
        imageView.clipsToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        return imageView
    }()
    
    lazy var takePictureButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(takePictureTouched), for: .touchDown)
        button.backgroundColor = Colors.butaofundo()
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Take Picture", for: .normal)
        return button
    }()
    
    lazy var galleryButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(chooseFromGalleryTouched), for: .touchDown)
        button.backgroundColor = Colors.butaofundo()
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Choose from Gallery", for: .normal)
        return button
    }()
    
    lazy var saveImageButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(saveImageTouched), for: .touchDown)
        button.backgroundColor = Colors.butaofundo()
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Save Card", for: .normal)
        return button
    }()
    
    lazy var manaTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.textColor = .white
        
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            .strokeColor : UIColor.black,
            .foregroundColor : UIColor.white,
            .strokeWidth : -1.0,
            .font : UIFont.boldSystemFont(ofSize: 38)
            ]
        
        textField.attributedText = NSAttributedString(string: " ", attributes: strokeTextAttributes)
        return textField
    }()
    
    lazy var attackTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.textColor = .white
        
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            .strokeColor : UIColor.black,
            .foregroundColor : UIColor.white,
            .strokeWidth : -1.0,
            .font : UIFont.boldSystemFont(ofSize: 29)
            ]
        
        textField.attributedText = NSAttributedString(string: " ", attributes: strokeTextAttributes)
        return textField
    }()
    
    lazy var healthTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.textColor = .white
        
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            .strokeColor : UIColor.black,
            .foregroundColor : UIColor.white,
            .strokeWidth : -1.0,
            .font : UIFont.boldSystemFont(ofSize: 29)
            ]
        
        textField.attributedText = NSAttributedString(string: " ", attributes: strokeTextAttributes)
        return textField
    }()
    
    lazy var descriptionTextView: UITextView = {
        let textField = UITextView()
        textField.textColor = .black
        textField.font = .boldSystemFont(ofSize: 15)
        textField.backgroundColor = .clear
        return textField
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.textColor = .black
        textField.font = .boldSystemFont(ofSize: 17)
        
        return textField
    }()

    internal init(presenter: CreateCustomCardPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    @objc func takePictureTouched() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            present(picker, animated: true)
        }
    }
    
    @objc func chooseFromGalleryTouched() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc func saveImageTouched() {
        let bounds = self.printView.bounds
        let size = CGSize(width: bounds.width, height: bounds.height)
        
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        
        self.printView.drawHierarchy(in: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height), afterScreenUpdates: true)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
    }

}

extension CreateCustomCardViewController {
    func configViews() {
        view.backgroundColor = Colors.fundo()
    }
    
    func buildViews() {
        
        view.addSubview(printView)
        
        printView.addSubview(pictureImageView)
        printView.addSubview(templateImageView)
        printView.addSubview(manaTextField)
        printView.addSubview(attackTextField)
        printView.addSubview(healthTextField)
        printView.addSubview(descriptionTextView)
        printView.addSubview(nameTextField)
        
        view.addSubview(takePictureButton)
        view.addSubview(galleryButton)
        view.addSubview(saveImageButton)
    }
    
    func buildConstraints() {
        printView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(450)
        }
        
        templateImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(450)
            make.centerX.equalToSuperview()
        }
        
        pictureImageView.snp.makeConstraints { make in
            make.top.equalTo(templateImageView).offset(50)
            make.height.equalTo(245)
            make.width.equalTo(210)
            make.centerX.equalTo(templateImageView)
        }
        
        manaTextField.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.top.equalTo(templateImageView).offset(70)
            make.leading.equalTo(templateImageView).offset(80)
        }
        
        attackTextField.snp.makeConstraints { make in
            make.size.equalTo(35)
            make.bottom.equalTo(templateImageView).inset(48)
            make.leading.equalTo(templateImageView).offset(85)
        }
        
        healthTextField.snp.makeConstraints { make in
            make.size.equalTo(35)
            make.bottom.equalTo(templateImageView).inset(48)
            make.trailing.equalTo(templateImageView).inset(105)
        }
        
        descriptionTextView.snp.makeConstraints { make in
            make.height.equalTo(65)
            make.width.equalTo(145)
            make.bottom.equalTo(templateImageView).inset(75)
            make.centerX.equalTo(templateImageView)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(140)
            make.bottom.equalTo(templateImageView).inset(170)
            make.centerX.equalTo(templateImageView).offset(-8)
        }
        
        takePictureButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(250)
            make.centerX.equalToSuperview()
        }
        
        galleryButton.snp.makeConstraints { make in
            make.bottom.equalTo(takePictureButton).inset(40)
            make.width.equalTo(250)
            make.centerX.equalToSuperview()
        }
        
        saveImageButton.snp.makeConstraints { make in
            make.bottom.equalTo(galleryButton).inset(40)
            make.width.equalTo(250)
            make.centerX.equalToSuperview()
        }
    }
}

extension CreateCustomCardViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        pictureImageView.image = image
    }
}

// MARK: - CreateCustomCardViewControllerProtocol
extension CreateCustomCardViewController: CreateCustomCardViewProtocol {

}
