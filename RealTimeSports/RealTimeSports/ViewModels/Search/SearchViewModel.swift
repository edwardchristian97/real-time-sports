//
//  SearchViewModel.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//

import UIKit

class SearchViewModel {

    private let dispatchGroup: DispatchGroup
    private let playerService: PlayerServiceProtocol
    private let userDefaults: UserDefaultsServiceProtocol

    init(
        playerService: PlayerServiceProtocol,
        userDefaults: UserDefaultsServiceProtocol) {
            self.dispatchGroup = DispatchGroup()
            self.playerService = playerService
            self.userDefaults = userDefaults
    }

}

// MARK: Actions
extension SearchViewModel {

    func searchPlayer(with name: String, completion: @escaping (Result<[Player], PlayerError>) -> Void) {
        var players: [Player] = []

        playerService.searchPlayer(with: name, completion: { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(let results):
                for player in results {
                    self.dispatchGroup.enter()

                    let playerId = player.idPlayer
                    let playerName = player.strPlayer
                    let playerTeam = player.strTeam ?? "-"
                    let playerBirthDate = player.dateBorn ?? "-"
                    let defaultImage = UIImage(named: "AppDefaultUser")

                    if let imageURL = player.strThumb, let url = URL(string: imageURL) {
                        self.playerService.downloadImage(url: url) { imageResult in
                            switch imageResult {

                            case .success(let imageData):
                                if let image = UIImage(data: imageData) {
                                    let player = Player(
                                        id: playerId,
                                        name: playerName,
                                        team: playerTeam,
                                        birthDate: playerBirthDate,
                                        image: image)
                                    players.append(player)
                                } else {
                                    let player = Player(
                                        id: playerId,
                                        name: playerName,
                                        team: playerTeam,
                                        birthDate: playerBirthDate,
                                        image: defaultImage)
                                    players.append(player)
                                }

                            case .failure(let error):
                                print(error)
                                let player = Player(
                                    id: playerId,
                                    name: playerName,
                                    team: playerTeam,
                                    birthDate: playerBirthDate,
                                    image: defaultImage)
                                players.append(player)
                            }

                            self.dispatchGroup.leave()
                        }
                    } else {
                        let player = Player(
                            id: playerId,
                            name: playerName,
                            team: playerTeam,
                            birthDate: playerBirthDate,
                            image: defaultImage)
                        players.append(player)
                        self.dispatchGroup.leave()
                    }
                }

                self.dispatchGroup.notify(queue: DispatchQueue.main) {
                    completion(.success(players))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        })
    }

    func setRecentSearches(_ recentSearches: [String]) {
        userDefaults.setRecentSearches(recentSearches, forKey: UserDefaultsService.recentSearchesKey)
    }

    func getRecentSearches() -> [String] {
        userDefaults.getRecentSearches(forKey: UserDefaultsService.recentSearchesKey)
    }

}
