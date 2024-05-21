//
//  PopularViewController.swift
//  periferiaTheMoviesDBSwift
//
//  Created by Sergio Luis Noriega Pita on 20/05/24.
//

import UIKit
import Combine

class PopularViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var filterView: UIView!
    
    let viewModel = PopularViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    //    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("View PopularViewController")
//        view.backgroundColor = .gray
        setupSearchBar()
        setupFilterView()
        setupTableView()
        fetchPopularMovies() // función para obtener los datos
        setupBindings() // configurar los observadores
    }
    
    
    func setupBindings() {
        viewModel.$popularMovies
            .sink { [weak self] _ in
                DispatchQueue.main.async {
                    self?.tableView?.reloadData()
                }
            }
            .store(in: &cancellables)
    }
    
    
    func setupSearchBar() {
        searchBar?.delegate = self
    }
    
    func setupFilterView() {
        // vista de filtros, como agregar botones para "adult", "original_language", etc.
    }
    
    func setupTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        // Registrar la celda personalizada
        tableView?.estimatedRowHeight = 160 // Estimation for row height
        tableView?.rowHeight = UITableView.automaticDimension
        
        let nib = UINib(nibName: "PopularTableViewCell", bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: "MovieCell")
    }
    
    func fetchPopularMovies() {
        debugPrint("Popular TableView FetchPopular")
        viewModel.fetchPopularMovies()
        
    }
    
}

extension PopularViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Aquí puedes realizar la búsqueda de películas basada en el texto ingresado en la barra de búsqueda.
        // Puedes actualizar la tabla con los resultados de la búsqueda.
    }
}

extension PopularViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return movies.count
        return viewModel.popularMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! PopularTableViewCell
        let movie = viewModel.popularMovies[indexPath.row]
        cell.configure(with: movie)
        debugPrint("Configuring cell for movie: \(movie.title)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Aselección de una película en la tabla, por ejemplo, mostrar detalles de la película.
    }
}
