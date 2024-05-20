//
//  TopRatedViewModel.swift
//  periferiaTheMoviesDBSwift
//
//  Created by Sergio Luis Noriega Pita on 20/05/24.
//

import Foundation

class TopRatedViewModel {
    var topRatedMovies: [Movie] = []
    var didUpdateMovies: (() -> Void)?

    func fetchTopRatedMovies() {
        APIManager.shared.fetchMovies(endpoint: "top_rated") { [weak self] result in
            switch result {
            case .success(let movies):
                self?.topRatedMovies = movies
                self?.didUpdateMovies?()
            case .failure(let error):
                print(error)
            }
        }
    }
}
