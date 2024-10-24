//
//  LeagueStandingsViewController.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//

import UIKit
import Lottie

class LeagueStandingsViewController: UIViewController {

    private let leagueId: String
    private let viewModel: LeagueStandingsViewModel = ViewModelFactory.makeLeagueStandingsViewModel()
    private var leagueStandings: [Team] = []

    var errorView: ErrorView!
    var leagueStandingsTableView: UITableView!
    var loadingAnimation: LottieAnimationView!

    init(leagueId: String) {
        self.leagueId = leagueId
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        setupTableView()
        fetchLeagueStandings()
    }

    private func fetchLeagueStandings() {
        loadingAnimation.isHidden = false
        loadingAnimation.play()

        viewModel.fetchLeagueStandings(id: leagueId) { result in
            self.loadingAnimation.isHidden = true
            self.loadingAnimation.stop()

            DispatchQueue.main.async {
                switch result {
                case .success(let standings):
                    self.leagueStandings = standings
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
extension LeagueStandingsViewController: UITableViewDelegate, UITableViewDataSource {

    private func setupTableView() {
        leagueStandingsTableView.dataSource = self
        leagueStandingsTableView.delegate = self

        leagueStandingsTableView.register(TeamRankTableViewCell.self, forCellReuseIdentifier: TeamRankTableViewCell.cellIdentifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        leagueStandings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TeamRankTableViewCell.cellIdentifier,
            for: indexPath) as! TeamRankTableViewCell
        cell.setTeam(leagueStandings[indexPath.row])
        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TeamRankHeaderView()
        return headerView
    }

    private func updateTableView() {
        guard leagueStandings.count > 0 else { return }
        
        leagueStandingsTableView.performBatchUpdates({
            let indexPathsToInsert = (0..<leagueStandings.count).map { IndexPath(row: $0, section: 0) }
            leagueStandingsTableView.insertRows(at: indexPathsToInsert, with: .fade)
        }, completion: nil)
    }

}
