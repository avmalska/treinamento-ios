//
//  GameViewController.swift
//  Memoria
//
//  Created by Juan Andrey Valverde Malska on 21/07/22.
//

import Foundation
import UIKit
import SnapKit

class GameViewController: UIViewController {
    
    lazy var cardButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "image 1"), for: .normal)
        button.addTarget(self, action: #selector(clickCardButton), for: .touchDown)
        return button
    }()
    
    @objc private func clickCardButton() {
        print("boton")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
    }
}

extension GameViewController {
    func configViews() {
        view.backgroundColor = .white
    }
    
    func buildViews() {
    }
    
    func buildConstraints() {
    }
}
