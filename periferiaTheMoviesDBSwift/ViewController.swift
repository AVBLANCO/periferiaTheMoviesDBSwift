//
//  ViewController.swift
//  periferiaTheMoviesDBSwift
//
//  Created by Sergio Luis Noriega Pita on 20/05/24.
//

import UIKit

class ViewController: UIViewController {
    let popularView = PopularViewController()
    let topRatedView = TopRatedViewController()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        debugPrint("View Did load")
        didTapSegment(segment: UISegmentedControl(items: ["Popular", "Top Rated"])) // Simula la selección del primer segmento
        setup()
    }
    
    
    @IBAction func didTapSegment(segment: UISegmentedControl) {
        popularView.view.isHidden = true
        topRatedView.view.isHidden = true
        
        if segment.selectedSegmentIndex == 0 {
            // mostrar el popular
            popularView.view.isHidden = false
            
        } else {
            // mostrar el toprated
            topRatedView.view.isHidden = false
        }
    }
    
    func setup(){
        
        addChild(popularView)
        addChild(topRatedView)
        
        self.view.addSubview(popularView.view)
        self.view.addSubview(topRatedView.view)
        
        popularView.didMove(toParent: self)
        topRatedView.didMove(toParent: self)
        
        popularView.view.frame = self.view.bounds
        topRatedView.view.frame = self.view.bounds
        topRatedView.view.isHidden = true
    }


}

