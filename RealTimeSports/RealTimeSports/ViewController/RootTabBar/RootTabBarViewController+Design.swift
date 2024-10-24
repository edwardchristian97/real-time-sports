//
//  RootTabBarViewController+Design.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//

import UIKit

extension RootTabBarViewController: ViewControllerDesignProtocol {

    func createViews() {

    }

    func styleViews() {
        setupTabBarAppearance()
    }

    func setConstraintsForViews() {

    }

    func setAccessibilityIdentifiers() {
        tabBar.isAccessibilityElement = true
        tabBar.accessibilityHint = "Tab bar with two tabs"
    }

    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .dynamicAppGreen
        appearance.stackedLayoutAppearance.normal.iconColor = .systemGray2
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.systemGray2]
        appearance.stackedLayoutAppearance.selected.iconColor = .systemBackground
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemBackground]

        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }

}
