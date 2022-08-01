//
//  ViewController.swift
//  Memoria
//
//  Created by Juan Andrey Valverde Malska on 20/07/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var reiniciarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 5
        stackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(restartOnClick)))
        return stackView
    }()
    
    lazy var reiniciarLabel: UILabel = {
        let label = UILabel()
        label.text = "Reiniciar"
        label.font = .systemFont(ofSize: 33)
        return label
    }()
    
    lazy var reiniciarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "restart.circle")
        imageView.tintColor = .black
        return imageView
    }()
    
    lazy var gameCardsStackViewFirstRow: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .equalSpacing
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    
    lazy var gameCardsStackViewSecondRow: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .equalSpacing
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    
    @objc func restartOnClick() {
        print("restart click")
    }
    
    
    private var jogoDaMemoria = JogoDaMemoria()
    
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
        
        jogoDaMemoria.randomize()
        
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
        view.addSubview(reiniciarStackView)
        view.addSubview(gameCardsStackViewFirstRow)
        view.addSubview(gameCardsStackViewSecondRow)
        
        for numb in jogoDaMemoria.gameCardsNumbersArray[...4] {
            let gameCardView = GameCardView(id: numb)
            gameCardView.delegate = self
            gameCardsStackViewFirstRow.addArrangedSubview(gameCardView)
        }
        
        for numb in jogoDaMemoria.gameCardsNumbersArray[5...] {
            let gameCardView = GameCardView(id: numb)
            gameCardView.delegate = self
            gameCardsStackViewSecondRow.addArrangedSubview(gameCardView)
        }
        
        reiniciarStackView.addArrangedSubview(reiniciarLabel)
        reiniciarStackView.addArrangedSubview(reiniciarImageView)
    }
    
    func buildConstraints() {
        reiniciarStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(40)
        }
        
        reiniciarImageView.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
        
        gameCardsStackViewFirstRow.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(101)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
        }
        
        gameCardsStackViewSecondRow.snp.makeConstraints { make in
            make.top.equalTo(gameCardsStackViewFirstRow.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
        }
    }
}

extension ViewController: GameCardViewDelegateProtocol{
    func touched(id: String) {
        print("tou")
    }
    
}
