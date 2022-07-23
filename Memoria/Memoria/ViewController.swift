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
    
    lazy var gameCardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image 1")
        return imageView
    }()
    
    lazy var gameCardsStackViewFirstRow: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 23
        stackView.distribution = .fillEqually
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    
    lazy var gameCardsStackViewSecondRow: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 23
        stackView.distribution = .fillEqually
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    
    func createGameCard(imgNumber: String) -> UIImageView {
        let gameCard = UIImageView()
        let cardNumber = imgNumber
        gameCard.image = UIImage(named: cardNumber)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gameCardOnClick(_:)))
        gameCard.addGestureRecognizer(tapGesture)
        gameCard.layer.setValue(cardNumber, forKey: "cardNumber")
        gameCard.isUserInteractionEnabled = true
        return gameCard
    }
    
    @objc func restartOnClick() {
        print("restart click")
    }
    
    @objc func gameCardOnClick(_ sender: UIGestureRecognizer) {
        guard let cardNumber = sender.view?.layer.value(forKey: "cardNumber") as? String else { return }
        print(cardNumber)
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
        
        for imageNumber in jogoDaMemoria.gameCardsNumbersArray[...4] {
            let arrangedCardView = createGameCard(imgNumber: imageNumber)
            gameCardsStackViewFirstRow.addArrangedSubview(arrangedCardView)
        }
        
        for imageNumber in jogoDaMemoria.gameCardsNumbersArray[5...] {
            let arrangedCardView = createGameCard(imgNumber: imageNumber)
            gameCardsStackViewSecondRow.addArrangedSubview(arrangedCardView)
        }
        
        reiniciarStackView.addArrangedSubview(reiniciarLabel)
        reiniciarStackView.addArrangedSubview(reiniciarImageView)
    }
    
    func buildConstraints() {
        reiniciarStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(22)
        }
        
        reiniciarImageView.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
        
        gameCardsStackViewFirstRow.snp.makeConstraints { make in
            make.height.equalTo(110)
            make.top.equalTo(reiniciarStackView.snp.bottom)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
        }
        
        gameCardsStackViewSecondRow.snp.makeConstraints { make in
            make.height.equalTo(110)
            make.top.equalTo(gameCardsStackViewFirstRow.snp.bottom)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
        }
    }
}
