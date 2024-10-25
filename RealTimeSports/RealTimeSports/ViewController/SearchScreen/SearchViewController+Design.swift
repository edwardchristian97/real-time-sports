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

        recentSearchesStackView = UIStackView()
        view.addSubview(recentSearchesStackView)

        searchTableView = UITableView()
        view.addSubview(searchTableView)
    }

    func styleViews() {
        view.backgroundColor = .systemBackground

        searchBar.placeholder = LocalizableStrings.searchPlaceholderTitle.localized
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        recentSearchesStackView.axis = .vertical
        recentSearchesStackView.spacing = 0
        recentSearchesStackView.alignment = .leading
        recentSearchesStackView.distribution = .fillProportionally
        recentSearchesStackView.backgroundColor = .clear

        searchTableView.rowHeight = 60
    }
    
    func setConstraintsForViews() {
        searchBar.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)

        recentSearchesStackView.autoPinEdge(.top, to: .bottom, of: searchBar, withOffset: 8)
        recentSearchesStackView.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        recentSearchesStackView.autoSetDimension(.width, toSize: 120)
        recentSearchesStackView.autoSetDimension(.height, toSize: 60)

        searchTableView.autoPinEdge(.top, to: .bottom, of: recentSearchesStackView)
        searchTableView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    }

    func setAccessibilityIdentifiers() {
        searchBar.isAccessibilityElement = true
        searchBar.accessibilityHint = "Search for a player"
    }

}
