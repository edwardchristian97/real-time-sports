//
//  SearchViewController.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import UIKit

class SearchViewController: UIViewController {

    private let viewModel = ViewModelFactory.makeSearchViewModel()
    private var searchResults: [Player] = []

    var searchBar: UISearchBar!
    var searchTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        setupKeyboardNotifications()
        setupSearchBar()
        setupTableView()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

// MARK: Actions
extension SearchViewController {

    private func searchPlayers(with searchText: String?) {
        guard let searchText else { return }

        viewModel.searchPlayer(with: searchText) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let players):
                    self.updateTableView(with: players)

                case .failure(let error):
                    print(error)
                    self.updateTableView(with: [
                        Player(
                            id: "",
                            name: LocalizableStrings.noResultsFound.localized,
                            team: "",
                            birthDate: "",
                            image: nil)])
                }
            }
        }
    }

}

// MARL: Search
extension SearchViewController: UISearchBarDelegate {

    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        searchBar.scopeButtonTitles = [
            SearchScope.players.title,
            SearchScope.teams.title,
            SearchScope.events.title]
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = searchBar.text
        searchPlayers(with: searchText)

    }

}

// MARK: Table View
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {

    private func setupTableView() {
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let player = searchResults[indexPath.row]
        var content = cell.defaultContentConfiguration()

        content.text = player.name
        content.secondaryText = player.team
        content.image = player.image

        cell.contentConfiguration = content
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let player = searchResults[indexPath.row]

        let playerViewController = PlayerViewController(player: player)
        present(playerViewController, animated: true)
    }

    private func updateTableView(with results: [Player]) {
        searchTableView.performBatchUpdates({
            let oldCount = self.searchResults.count
            let newCount = results.count

            let indexPathsToRemove = (0..<oldCount).map { IndexPath(row: $0, section: 0) }
            let indexPathsToInsert = (0..<newCount).map { IndexPath(row: $0, section: 0) }

            searchResults = results

            searchTableView.deleteRows(at: indexPathsToRemove, with: .fade)
            searchTableView.insertRows(at: indexPathsToInsert, with: .fade)
        }, completion: nil)
    }

}
