//
//  TeamRankTableViewCell.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import UIKit

class TeamRankTableViewCell: UITableViewCell {

    static let cellIdentifier = String(describing: TeamRankTableViewCell.self)

    var containerView: UIView!
    var teamRankLabel: UILabel!
    var teamImage: UIImageView!
    var teamNameLabel: UILabel!
    var teamPointsLabel: UILabel!

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

    func setTeam(_ team: Team) {
        teamRankLabel.text = team.leagueRank
        teamImage.image = team.image
        teamNameLabel.text = team.name
        teamPointsLabel.text = team.leaguePoints
    }

}
