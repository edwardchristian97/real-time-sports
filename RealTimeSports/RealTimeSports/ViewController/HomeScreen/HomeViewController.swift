//
//  ViewController.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//

import UIKit

class HomeViewController: UIViewController {

    var searchButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
    }

    @objc func searchButtonTapped() {
        let searchViewController = SearchViewController()
        present(searchViewController, animated: true)
    }

}

