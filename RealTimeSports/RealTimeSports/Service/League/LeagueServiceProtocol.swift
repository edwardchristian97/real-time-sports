//
//  LeagueServiceProtocol.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//
import Foundation
import Alamofire

protocol LeagueServiceProtocol {

    func league(id: String, completion: @escaping (Result<LeagueResponse, LeagueError>) -> Void)
    func allLeagues(completion: @escaping (Result<[LeagueResponse], LeagueError>) -> Void)
    func leagueStandings(id: String, completion: @escaping (Result<[TeamResponse], LeagueError>) -> Void)
    func downloadImage(url: URL, completion: @escaping (Result<Data, LeagueError>) -> Void)

}
