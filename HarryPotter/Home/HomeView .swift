//
//  View .swift
//  HarryPotter
//
//  Created by Danielle Nozaki Ogawa on 2024/06/30.
//

import Foundation
import UIKit

typealias TableViewDelegate = UITableViewDelegate & UITableViewDataSource

final class HomeView: UIView {

    lazy var characterTableView: UITableView = {
        var element = UITableView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegate(_ delegate: TableViewDelegate ) {
        self.characterTableView.delegate = delegate
        self.characterTableView.dataSource = delegate
        self.characterTableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifier)
    }
    
    private func setUpView() {
        addSubview(characterTableView)
        
        NSLayoutConstraint.activate([
            characterTableView.topAnchor.constraint(equalTo: topAnchor),
            characterTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
