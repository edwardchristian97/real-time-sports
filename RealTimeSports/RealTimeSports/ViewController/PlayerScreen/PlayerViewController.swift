//
//  PlayerViewController.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import UIKit

class PlayerViewController: UIViewController {

    private var player: Player

    var playerImage: UIImageView!
    var playerNameLabel: UILabel!
    var playerTeamLabel: UILabel!

    init(player: Player) {
        self.player = player
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        setupPlayer()
    }

    private func setupPlayer() {
        playerImage.image = player.image
        playerNameLabel.text = player.name
        playerTeamLabel.text = player.team
    }

}
