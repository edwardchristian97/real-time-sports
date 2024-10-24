//
//  MainScreenViewController+Design.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//
import UIKit

extension HomeViewController: ViewControllerDesignProtocol {

    func createViews() {
        searchButton = UIButton()

        let searchBarButtonItem = UIBarButtonItem(customView: searchButton)
        navigationItem.rightBarButtonItem = searchBarButtonItem

        liveEventsTableView = UITableView()
        view.addSubview(liveEventsTableView)

        errorView = ErrorView()
        view.addSubview(errorView)
    }

    func styleViews() {
        setupNavigationBarAppearance()
        setupSearchButton()

        liveEventsTableView.separatorStyle = .none
        liveEventsTableView.rowHeight = 180

        errorView.backgroundColor = .systemBackground
        errorView.isHidden = true
    }

    func setConstraintsForViews() {
        searchButton.autoSetDimensions(to: CGSize(width: 42, height: 42))
        liveEventsTableView.autoPinEdgesToSuperviewEdges()
        errorView.autoPinEdgesToSuperviewEdges()
    }

    func setAccessibilityIdentifiers() {
        searchButton.isAccessibilityElement = true
        searchButton.accessibilityHint = "Search button for players"
    }

    private func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .dynamicAppGreen
        appearance.titleTextAttributes = [.foregroundColor: UIColor.systemBackground]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBackground]

        navigationItem.title = LocalizableStrings.homeTitle.localized
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupSearchButton() {
        let config = UIImage.SymbolConfiguration(pointSize: 42, weight: .bold, scale: .large)
        let largeImage = UIImage(systemName: "magnifyingglass.circle.fill", withConfiguration: config)

        searchButton.setImage(largeImage, for: .normal)
        searchButton.tintColor = .systemBackground
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }

}
