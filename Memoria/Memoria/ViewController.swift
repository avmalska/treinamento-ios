//
//  ViewController.swift
//  Memoria
//
//  Created by Juan Andrey Valverde Malska on 20/07/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var startGameButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "image 1"), for: .normal)
        button.addTarget(self, action: #selector(startGame), for: .touchDown)
        return button
    }()
    
    @objc private func startGame() {
        present(GameViewController(), animated: true)
    }
    
    override public var shouldAutorotate: Bool {
        return false
    }
    
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
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
        view.addSubview(startGameButton)
    }
    
    func buildConstraints() {
        startGameButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
