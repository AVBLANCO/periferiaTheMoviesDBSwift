//
//  TopRatedViewController.swift
//  periferiaTheMoviesDBSwift
//
//  Created by Sergio Luis Noriega Pita on 20/05/24.
//

import UIKit
import Combine

class TopRatedViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let viewModel =  TopRatedViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        debugPrint("Hola Top Rated View")
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupCollectionView()
        setupBindings()
        fetchTopRatedMovies()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "TopRatedCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "TopRatedCell")
        
        // Configure the layout
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let spacing: CGFloat = 10
            let itemsPerRow: CGFloat = 3
            let totalSpacing = (itemsPerRow - 1) * spacing
            let itemWidth = (collectionView.bounds.width - totalSpacing) / itemsPerRow
            let itemHeight = itemWidth * 1.5 // Adjust the height as needed
            
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
            layout.minimumInteritemSpacing = spacing
            layout.minimumLineSpacing = spacing
        }
    }

    func setupBindings() {
         viewModel.$topRatedMovies
             .receive(on: DispatchQueue.main)
             .sink { [weak self] _ in
                 self?.collectionView.reloadData()
             }
             .store(in: &cancellables)
     }
     
     func fetchTopRatedMovies() {
         viewModel.fetchTopRatedMovies()
     }
}


extension TopRatedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.topRatedMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopRatedCell", for: indexPath) as! TopRatedCollectionViewCell
        let movie = viewModel.topRatedMovies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
}
