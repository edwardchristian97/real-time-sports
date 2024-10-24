//
//  TeamRankTableViewCell+Design.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import UIKit
import PureLayout

extension TeamRankTableViewCell: ViewDesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        containerView = UIView()
        contentView.addSubview(containerView)

        teamRankLabel = UILabel()
        containerView.addSubview(teamRankLabel)

        teamImage = UIImageView()
        containerView.addSubview(teamImage)

        teamNameLabel = UILabel()
        containerView.addSubview(teamNameLabel)

        teamPointsLabel = UILabel()
        containerView.addSubview(teamPointsLabel)
    }
    
    func styleViews() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        containerView.backgroundColor = .clear
    }
    
    func setConstraintsForViews() {
        containerView.autoPinEdgesToSuperviewEdges()

        teamRankLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        teamRankLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)

        teamImage.autoAlignAxis(toSuperviewAxis: .horizontal)
        teamImage.autoSetDimensions(to: CGSize(width: 32, height: 32))
        teamImage.autoPinEdge(toSuperviewEdge: .leading, withInset: 48)

        teamNameLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        teamNameLabel.autoPinEdge(.leading, to: .trailing, of: teamImage, withOffset: 8)

        teamPointsLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        teamPointsLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    }

}
