//
//  LiveEventTableViewCell+Design.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import UIKit
import PureLayout

extension LiveEventTableViewCell: ViewDesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
        setAccessibilityIdentifiers()
    }

    func createViews() {
        containerView = UIView()
        contentView.addSubview(containerView)

        homeTeamLabel = UILabel()
        containerView.addSubview(homeTeamLabel)

        awayTeamLabel = UILabel()
        containerView.addSubview(awayTeamLabel)

        homeTeamScoreLabel = UILabel()
        containerView.addSubview(homeTeamScoreLabel)

        awayTeamScoreLabel = UILabel()
        containerView.addSubview(awayTeamScoreLabel)

        progressTimeLabel = UILabel()
        containerView.addSubview(progressTimeLabel)
    }

    func styleViews() {
        containerView.backgroundColor = .dynamicAppGreen
        containerView.layer.cornerRadius = 24

        homeTeamLabel.font = .boldSystemFont(ofSize: 20)
        homeTeamLabel.textColor = .systemBackground

        awayTeamLabel.font = .boldSystemFont(ofSize: 20)
        awayTeamLabel.textColor = .systemBackground

        homeTeamScoreLabel.font = .boldSystemFont(ofSize: 20)
        homeTeamScoreLabel.textColor = .systemBackground

        awayTeamScoreLabel.font = .boldSystemFont(ofSize: 20)
        awayTeamScoreLabel.textColor = .systemBackground

        progressTimeLabel.font = .systemFont(ofSize: 12)
        progressTimeLabel.textColor = .systemBackground
    }

    func setConstraintsForViews() {
        containerView.autoPinEdge(toSuperviewEdge: .top, withInset: 16)
        containerView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 16)
        containerView.autoPinEdge(toSuperviewEdge: .leading, withInset: 32)
        containerView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 32)

        progressTimeLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 16)
        progressTimeLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)

        homeTeamLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        homeTeamLabel.autoPinEdge(.bottom, to: .top, of: awayTeamLabel, withOffset: -8)

        awayTeamLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        awayTeamLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 16)

        homeTeamScoreLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
        homeTeamScoreLabel.autoPinEdge(.bottom, to: .top, of: awayTeamScoreLabel, withOffset: -8)

        awayTeamScoreLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
        awayTeamScoreLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 16)
    }

    func setAccessibilityIdentifiers() {
        homeTeamLabel.isAccessibilityElement = true
        homeTeamLabel.accessibilityHint = "Home team name"

        awayTeamLabel.isAccessibilityElement = true
        awayTeamLabel.accessibilityHint = "Away team name"

        homeTeamScoreLabel.isAccessibilityElement = true
        homeTeamScoreLabel.accessibilityHint = "Home team score"

        awayTeamScoreLabel.isAccessibilityElement = true
        awayTeamScoreLabel.accessibilityHint = "Away team score"

        progressTimeLabel.isAccessibilityElement = true
        progressTimeLabel.accessibilityHint = "Progress time in minutes"
    }

}
