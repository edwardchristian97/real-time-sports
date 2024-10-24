//
//  PlayerViewModel.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//

import UIKit

class PlayerViewModel {

    private let dispatchGroup: DispatchGroup
    private let playerService: PlayerServiceProtocol

    init(playerService: PlayerServiceProtocol) {
        self.dispatchGroup = DispatchGroup()
        self.playerService = playerService
    }

}

