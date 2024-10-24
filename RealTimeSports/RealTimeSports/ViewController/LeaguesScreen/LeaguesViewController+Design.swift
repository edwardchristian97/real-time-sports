//
//  LeaguesViewController+Design.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//
import UIKit
import PureLayout
import Lottie

extension LeaguesViewController: ViewControllerDesignProtocol {

    func createViews() {
        leaguesTableView = UITableView()
        view.addSubview(leaguesTableView)

        loadingAnimation = LottieAnimationView()
        view.addSubview(loadingAnimation)
    }

    func styleViews() {
        setupNavigationBarAppearance()

        loadingAnimation.animation = LottieAnimation.named("loading-animation")
        loadingAnimation.loopMode = .loop
        loadingAnimation.contentMode = .scaleAspectFit
        loadingAnimation.clipsToBounds = false
        loadingAnimation.isHidden = true
    }

    func setConstraintsForViews() {
        leaguesTableView.rowHeight = 80
        leaguesTableView.autoPinEdgesToSuperviewEdges()

        loadingAnimation.autoAlignAxis(toSuperviewAxis: .horizontal)
        loadingAnimation.autoAlignAxis(toSuperviewAxis: .vertical)
        loadingAnimation.autoSetDimensions(to: CGSize(width: 60, height: 60))
    }

    func setAccessibilityIdentifiers() {
        leaguesTableView.isAccessibilityElement = true
        leaguesTableView.accessibilityHint = "List of leagues"
    }

    private func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .dynamicAppGreen
        appearance.titleTextAttributes = [.foregroundColor: UIColor.systemBackground]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBackground]

        navigationItem.title = LocalizableStrings.leaguesTitle.localized
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
