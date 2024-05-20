//
//  ViewController.swift
//  periferiaTheMoviesDBSwift
//
//  Created by Sergio Luis Noriega Pita on 20/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentButtton: UISegmentedControl!
    @IBOutlet weak var popularContainerView: UIView!
    @IBOutlet weak var topRatedContainerView: UIView!
    
    private var popularViewController: PopularViewController?
//    private var popularViewController = PopularViewController()
    private var topRatedViewController: TopRatedViewController?
//    private var topRatedViewController = TopRatedViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        segmentButtton.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
        setupView()
    }

    private func setupView() {
        segmentButtton.selectedSegmentIndex = 0
        popularContainerView?.isHidden = false
        topRatedContainerView?.isHidden = true
        loadViewControllers()
    }  

    private func loadViewControllers() {
        // Cargar PopularViewController
        let popularStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let popularVC = popularStoryboard.instantiateViewController(withIdentifier: "PopularViewController") as? PopularViewController {
            popularViewController = popularVC
            addChild(popularViewController!)
//            popularViewController?.view.frame = popularContainerView!.bounds
            if let popularContainerBounds = popularContainerView?.bounds {
                popularViewController?.view.frame = popularContainerBounds
            }
            popularContainerView?.addSubview(popularViewController!.view)
            popularViewController?.didMove(toParent: self)
        }
        
        // Cargar TopRatedViewController
        let topRatedStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let topRatedVC = topRatedStoryboard.instantiateViewController(withIdentifier: "TopRatedViewController") as? TopRatedViewController {
            topRatedViewController = topRatedVC
            addChild(topRatedViewController!)
//            topRatedViewController?.view.frame = topRatedContainerView.bounds
            if let topRatedViewControllerBounds = topRatedContainerView?.bounds {
                topRatedViewController?.view.frame = topRatedViewControllerBounds
            }
            topRatedContainerView?.addSubview(topRatedViewController!.view)
            topRatedViewController?.didMove(toParent: self)
        }
    }

    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }

    private func updateView() {
        if segmentButtton.selectedSegmentIndex == 0 {
            popularContainerView?.isHidden = false
            topRatedContainerView?.isHidden = true
        } else {
            popularContainerView?.isHidden = true
            topRatedContainerView?.isHidden = false
        }
    }

}
