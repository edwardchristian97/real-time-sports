//
//  TeamService.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//
import Foundation
import Alamofire

class TeamService: TeamServiceProtocol {

    private let urlBuilder: CommonURLBuilder
    private let httpClient: HTTPClient

    init(urlBuilder: CommonURLBuilder, httpClient: HTTPClient) {
        self.urlBuilder = urlBuilder
        self.httpClient = httpClient
    }

    func team(id: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        var request = URLRequest(
            url: urlBuilder
                .lookupURL
                .appendingPathComponent(urlBuilder.teamKey)
                .appendingPathComponent(id)
        )

        request.httpMethod = HTTPMethodType.get.rawValue
        request.setValue(urlBuilder.apiKey, forHTTPHeaderField: urlBuilder.apiHeader)

        httpClient.getRequest(url: request) { result in
            switch result {

            case .success(let data):
                completion(.success(data))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
