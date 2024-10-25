//
//  LiveEventTableViewCell.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import UIKit

class LiveEventTableViewCell: UITableViewCell {

    static let cellIdentifier = String(describing: LiveEventTableViewCell.self)

    var containerView: UIView!
    var homeTeamLabel: UILabel!
    var awayTeamLabel: UILabel!
    var homeTeamScoreLabel: UILabel!
    var awayTeamScoreLabel: UILabel!
    var progressTimeLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        buildViews()
    }

    override func didMoveToSuperview() {
        setConstraintsForViews()
    }

    func set(liveEvent: LiveEvent) {
        homeTeamLabel.text = liveEvent.homeTeamName
        awayTeamLabel.text = liveEvent.awayTeamName
        homeTeamScoreLabel.text = liveEvent.homeTeamScore
        awayTeamScoreLabel.text = liveEvent.awayTeamScore
        progressTimeLabel.text = "\(LocalizableStrings.liveTitle.localized) \(liveEvent.progressTime)" 
    }

}
