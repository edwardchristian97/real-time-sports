//
//  LeagueStandingsViewController+Design.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import UIKit
import Lottie

extension LeagueStandingsViewController: ViewControllerDesignProtocol {

    func createViews() {
        leagueStandingsTableView = UITableView()
        view.addSubview(leagueStandingsTableView)

        errorView = ErrorView()
        view.addSubview(errorView)

        loadingAnimation = LottieAnimationView()
        view.addSubview(loadingAnimation)
    }
    
    func styleViews() {
        errorView.backgroundColor = .systemBackground
        errorView.isHidden = true

        navigationItem.largeTitleDisplayMode = .never

        loadingAnimation.animation = LottieAnimation.named("loading-animation")
        loadingAnimation.loopMode = .loop
        loadingAnimation.contentMode = .scaleAspectFit
        loadingAnimation.clipsToBounds = false
        loadingAnimation.isHidden = true
    }
    
    func setConstraintsForViews() {
        errorView.autoPinEdgesToSuperviewEdges()

        leagueStandingsTableView.rowHeight = 60
        leagueStandingsTableView.autoPinEdgesToSuperviewEdges()

        loadingAnimation.autoAlignAxis(toSuperviewAxis: .horizontal)
        loadingAnimation.autoAlignAxis(toSuperviewAxis: .vertical)
        loadingAnimation.autoSetDimensions(to: CGSize(width: 60, height: 60))
    }

    func setAccessibilityIdentifiers() {
        leagueStandingsTableView.isAccessibilityElement = true
        leagueStandingsTableView.accessibilityHint = "List of league standings"
    }

}
