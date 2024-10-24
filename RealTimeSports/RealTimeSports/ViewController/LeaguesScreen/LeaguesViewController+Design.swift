//
//  LeaguesViewController+Design.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//
import UIKit
import PureLayout

extension LeaguesViewController: ViewControllerDesignProtocol {

    func createViews() {
        leaguesTableView = UITableView()
        view.addSubview(leaguesTableView)
    }

    func styleViews() {
        setupNavigationBarAppearance()
    }

    func setConstraintsForViews() {
        leaguesTableView.rowHeight = 80
        leaguesTableView.autoPinEdgesToSuperviewEdges()
    }

    private func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .dynamicAppGreen
        appearance.titleTextAttributes = [.foregroundColor: UIColor.systemBackground]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBackground]

        navigationItem.title = LocalizableStrings.leaguesTitle.localized
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
