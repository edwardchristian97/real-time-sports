//
//  SearchViewController+Design.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import UIKit

extension SearchViewController: ViewControllerDesignProtocol {

    func createViews() {
        searchBar = UISearchBar()
        view.addSubview(searchBar)

        searchTableView = UITableView()
        view.addSubview(searchTableView)
    }

    func styleViews() {
        view.backgroundColor = .systemBackground

        searchBar.placeholder = LocalizableStrings.searchPlaceholderTitle.localized
        searchBar.selectedScopeButtonIndex = 0 // Set default scope
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        searchTableView.rowHeight = 60
    }
    
    func setConstraintsForViews() {
        searchBar.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        searchBar.autoPinEdge(.bottom, to: .top, of: searchTableView, withOffset: -16)

        searchTableView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    }

    func setAccessibilityIdentifiers() {
        searchBar.isAccessibilityElement = true
        searchBar.accessibilityHint = "Search for a player"
    }

}
