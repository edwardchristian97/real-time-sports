//
//  TeamRankHeaderView.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import UIKit

class TeamRankHeaderView: UIView {

    var containerView: UIView!
    var teamRankLabel: UILabel!
    var teamNameLabel: UILabel!
    var teamPointsLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildViews()
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setConstraintsForViews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        styleViews()
    }

}
