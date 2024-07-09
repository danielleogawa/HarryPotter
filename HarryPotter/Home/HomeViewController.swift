//
//  ViewController.swift
//  HarryPotter
//
//  Created by Danielle Nozaki Ogawa on 2024/06/30.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeView: HomeView?
    var viewModel: HomeViewViewModel?
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        self.homeView = HomeView()
        self.viewModel = HomeViewViewModel(delegate: self)
        self.homeView?.setDelegate(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: HomeViewViewModelDelegate {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.homeView?.characterTableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.characters.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as? CharacterTableViewCell,
              let character = viewModel?.characters[indexPath.row] else {
            return UITableViewCell()
        }
        cell.updateCell(name: character.name, house: character.house, wand: character.wand, thumbnailImage: character.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
}
