//
//  RepositoryTableViewCell.swift
//  GithubRepositories
//
//  Created by Juan Andrey Valverde Malska on 31/07/22.
//

import Foundation
import UIKit
import Rswift

class RepositoryTableViewCell: UITableViewCell {
    
    static let reuseIentifier: ReuseIdentifier<RepositoryTableViewCell> = ReuseIdentifier(identifier: "repository-cell")
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with repository: Repository) {
        nameLabel.text = repository.name
    }
}

extension RepositoryTableViewCell {
    func configViews() {
        backgroundColor = .white
    }
    
    func buildViews() {
        contentView.addSubview(nameLabel)
    }
    
    func buildConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
