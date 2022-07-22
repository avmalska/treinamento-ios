//
//  ViewController.swift
//  Memoria
//
//  Created by Juan Andrey Valverde Malska on 20/07/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var reiniciarButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Reiniciar", for: .normal)
        button.setImage(UIImage(systemName: "restart.circle"), for: .normal)
        button.tintColor = .black
        button.semanticContentAttribute = .forceRightToLeft
        button.addTarget(self, action: #selector(buttonOnClick), for: .touchDown)
        return button
    }()
    
    lazy var gameCard: UIImageView = {
        let gameCard = UIImageView()
        gameCard.image = UIImage(named: "image 1")
        return gameCard
    }()
    
    @objc func buttonOnClick() {
        print("click")
    }
    
    override public var shouldAutorotate: Bool {
        return false
    }
    
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }
    
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeLeft
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
}


// MARK: - setup das views
extension ViewController {
    
    func configViews() {
        view.backgroundColor = .white
    }
    
    func buildViews() {
        view.addSubview(reiniciarButton)
        view.addSubview(gameCard)
    }
    
    func buildConstraints() {
        reiniciarButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(22)
        }
        
        gameCard.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
