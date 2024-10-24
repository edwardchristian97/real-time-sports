//
//  PlayerViewController+Design.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import UIKit

extension PlayerViewController: ViewControllerDesignProtocol {

    func createViews() {
        playerImage = UIImageView()
        view.addSubview(playerImage)

        playerNameLabel = UILabel()
        view.addSubview(playerNameLabel)

        playerTeamLabel = UILabel()
        view.addSubview(playerTeamLabel)
    }
    
    func styleViews() {
        view.backgroundColor = .systemBackground

        playerImage.layer.cornerRadius = 32
        playerImage.clipsToBounds = true

        playerNameLabel.font = .preferredFont(forTextStyle: .largeTitle)
        playerNameLabel.textAlignment = .center

        playerTeamLabel.font = .preferredFont(forTextStyle: .title1)
        playerTeamLabel.textAlignment = .center
    }
    
    func setConstraintsForViews() {

        playerImage.autoAlignAxis(toSuperviewAxis: .horizontal)
        playerImage.autoAlignAxis(toSuperviewAxis: .vertical)
        playerImage.autoSetDimensions(to: CGSize(width: 300, height: 300))

        playerNameLabel.autoPinEdge(.bottom, to: .top, of: playerTeamLabel)
        playerNameLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        playerNameLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)

        playerTeamLabel.autoPinEdge(.bottom, to: .top, of: playerImage, withOffset: -8)
        playerTeamLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        playerTeamLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    }

    func setAccessibilityIdentifiers() {
        playerImage.isAccessibilityElement = true
        playerImage.accessibilityHint = "Image of the player"

        playerNameLabel.isAccessibilityElement = true
        playerNameLabel.accessibilityHint = "Name of the player"

        playerTeamLabel.isAccessibilityElement = true
        playerTeamLabel.accessibilityHint = "Team of the player"
    }

}
