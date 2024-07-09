//
//  HomeViewViewModel.swift
//  HarryPotter
//
//  Created by Danielle Nozaki Ogawa on 2024/07/08.
//

import Foundation

protocol HomeViewViewModelDelegate {
    func reloadTableView()
}

final class HomeViewViewModel {
    
    var delegate: HomeViewViewModelDelegate
    
    init(delegate: HomeViewViewModelDelegate) {
        self.delegate = delegate
        Task { try await getCharacters() }
    }
    
    
    var characters: [Characters] = [] {
        didSet {
            delegate.reloadTableView()
        }
    }
    
    func getCharacters() async throws {
        let url = Request.endpoint.characters.rawValue
        characters = try await Request.request(expecting: [Characters].self, urlString: url)
    }
}
