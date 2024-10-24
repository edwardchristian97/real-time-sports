//
//  TeamRankHeaderView+Design.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import UIKit
import PureLayout

extension TeamRankHeaderView: ViewDesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        containerView = UIView()
        addSubview(containerView)

        teamRankLabel = UILabel()
        containerView.addSubview(teamRankLabel)

        teamNameLabel = UILabel()
        containerView.addSubview(teamNameLabel)

        teamPointsLabel = UILabel()
        containerView.addSubview(teamPointsLabel)
    }
    
    func styleViews() {
        containerView.backgroundColor = .systemBackground
        teamRankLabel.text = LocalizableStrings.rankSymbol.localized
        teamNameLabel.text = LocalizableStrings.teamRankHeaderTitle.localized
        teamPointsLabel.text = LocalizableStrings.teamPointsHeaderTitle.localized
    }
    
    func setConstraintsForViews() {
        containerView.autoPinEdgesToSuperviewEdges()

        teamRankLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        teamRankLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)

        teamNameLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        teamNameLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 48)

        teamPointsLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        teamPointsLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    }
    
}
