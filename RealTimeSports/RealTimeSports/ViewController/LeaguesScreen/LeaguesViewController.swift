//
//  LeaguesViewController.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//

import UIKit

class LeaguesViewController: UIViewController {

    private var leagues: [League] = []
    private let viewModel: LeaguesViewModel = ViewModelFactory.makeLeaguesViewModel()

    var leaguesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        setupTableView()
        fetchAllLeagues()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let indexPath = leaguesTableView.indexPathForSelectedRow {
            leaguesTableView.deselectRow(at: indexPath, animated: true)
        }
    }

    private func fetchAllLeagues() {
        viewModel.fetchAllLeagues { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let leagues):
                    self.leagues = leagues
                    self.updateTableView()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }

}

// MARK: Table View
extension LeaguesViewController: UITableViewDelegate, UITableViewDataSource {

    private func setupTableView() {
        leaguesTableView.dataSource = self
        leaguesTableView.delegate = self

        leaguesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        leagues.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()

        content.text = leagues[indexPath.row].name
        content.secondaryText = leagues[indexPath.row].country
        content.image = leagues[indexPath.row].image

        cell.contentConfiguration = content
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let standingsViewController = LeagueStandingsViewController(leagueId: leagues[indexPath.row].id)
        standingsViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(standingsViewController, animated: true)
    }

    private func updateTableView() {
        leaguesTableView.performBatchUpdates({
            let indexPathsToInsert = (0..<leagues.count).map { IndexPath(row: $0, section: 0) }
            leaguesTableView.insertRows(at: indexPathsToInsert, with: .fade)
        }, completion: nil)
    }

}
