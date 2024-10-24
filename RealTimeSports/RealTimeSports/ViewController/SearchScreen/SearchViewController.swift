//
//  SearchViewController.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import UIKit

class SearchViewController: UIViewController {

    var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        setupSearchController()
    }

}

// MARK: Search Controller
extension SearchViewController: UISearchBarDelegate, UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {

    }

    private func setupSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.returnKeyType = .done
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.scopeButtonTitles = [
            SearchScope.players.title,
            SearchScope.teams.title,
            SearchScope.events.title]

        definesPresentationContext = true

        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

}
