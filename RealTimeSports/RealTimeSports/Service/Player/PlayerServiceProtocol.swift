//
//  PlayerServiceProtocol.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import Foundation

protocol PlayerServiceProtocol {

    func searchPlayer(with name: String, completion: @escaping (Result<[PlayerResponse], PlayerError>) -> Void)
    func downloadImage(url: URL, completion: @escaping (Result<Data, PlayerError>) -> Void)

}
