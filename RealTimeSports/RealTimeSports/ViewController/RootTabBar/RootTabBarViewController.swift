//
//  RootTabBarViewController.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//
import UIKit

class RootTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        setUpTabs()
    }

    private func setUpTabs() {
        let homeNavigationController = navigationController(
            for: HomeViewController(),
            with: "Home",
            and: UIImage(systemName: "soccerball"))

        let leaguesNavigationController = navigationController(
            for: LeaguesViewController(),
            with: "Leagues",
            and: UIImage(systemName: "trophy"))
        
        setViewControllers([homeNavigationController, leaguesNavigationController], animated: false)
    }

    private func navigationController(
        for viewController: UIViewController,
        with title: String,
        and icon: UIImage?) -> UIViewController {
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.title = title
            navigationController.tabBarItem.image = icon

            return navigationController
    }

}
