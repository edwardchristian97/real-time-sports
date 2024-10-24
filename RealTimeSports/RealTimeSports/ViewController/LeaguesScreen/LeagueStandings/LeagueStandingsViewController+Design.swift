//
//  LeagueStandingsViewController+Design.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import UIKit

extension LeagueStandingsViewController: ViewControllerDesignProtocol {

    func createViews() {
        leagueStandingsTableView = UITableView()
        view.addSubview(leagueStandingsTableView)

        errorView = ErrorView()
        view.addSubview(errorView)
    }
    
    func styleViews() {
        errorView.backgroundColor = .systemBackground
        errorView.isHidden = true

        navigationItem.largeTitleDisplayMode = .never
    }
    
    func setConstraintsForViews() {
        errorView.autoPinEdgesToSuperviewEdges()

        leagueStandingsTableView.rowHeight = 60
        leagueStandingsTableView.autoPinEdgesToSuperviewEdges()
    }

}
