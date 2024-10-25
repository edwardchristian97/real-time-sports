//
//  LeaguesViewController.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//

import UIKit
import Lottie

class LeaguesViewController: UIViewController {

    private var leagues: [League] = []
    private let viewModel: LeaguesViewModel = ViewModelFactory.makeLeaguesViewModel()

    var errorView: ErrorView!
    var leaguesTableView: UITableView!
    var loadingAnimation: LottieAnimationView!

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
        loadingAnimation.isHidden = false
        loadingAnimation.play()

        viewModel.fetchAllLeagues { [weak self] result in
            guard let self else { return }
            
            self.loadingAnimation.isHidden = true
            self.loadingAnimation.stop()
            
            DispatchQueue.main.async {
                switch result {
                case .success(let leagues):
                    self.leagues = leagues
                    self.updateTableView()
                case .failure(let error):
                    self.errorView.setDescriptionLabel(error.userFriendlyDescription)
                    self.errorView.isHidden = false
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
        let league = leagues[indexPath.row]
        var content = cell.defaultContentConfiguration()

        content.text = league.name
        content.secondaryText = league.country
        content.image = league.image

        cell.contentConfiguration = content
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let standingsViewController = LeagueStandingsViewController(leagueId: leagues[indexPath.row].id)
        standingsViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(standingsViewController, animated: true)
    }

    private func updateTableView() {
        guard leagues.count > 0 else { return }

        leaguesTableView.performBatchUpdates({
            let indexPathsToInsert = (0..<leagues.count).map { IndexPath(row: $0, section: 0) }
            leaguesTableView.insertRows(at: indexPathsToInsert, with: .fade)
        }, completion: nil)
    }

}
