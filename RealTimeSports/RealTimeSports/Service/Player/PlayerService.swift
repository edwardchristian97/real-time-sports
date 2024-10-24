//
//  PlayerService.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import Foundation
import Alamofire

class PlayerService: PlayerServiceProtocol {

    private let urlBuilder: CommonURLBuilder
    private let httpClient: HTTPClient
    
    init(urlBuilder: CommonURLBuilder, httpClient: HTTPClient) {
        self.urlBuilder = urlBuilder
        self.httpClient = httpClient
    }

    func searchPlayer(with name: String, completion: @escaping (Result<[PlayerResponse], PlayerError>) -> Void) {
        var request = URLRequest(
            url: urlBuilder
                .searchURL
                .appendingPathComponent(urlBuilder.playerKey)
                .appendingPathComponent(name)
        )

        request.httpMethod = HTTPMethodType.get.rawValue
        request.setValue(urlBuilder.apiKey, forHTTPHeaderField: urlBuilder.apiHeader)

        httpClient.getRequest(url: request) { result in
            switch result {

            case .success(let data):
                if let data {
                    do {
                        let response = try JSONDecoder().decode(PlayerSearchResponse.self, from: data)
                        completion(.success(response.search))
                    } catch {
                        completion(.failure(.failedPlayerSearchResponseDecoding))
                    }
                }

            case .failure(_):
                completion(.failure(.failedSearchPlayerRequest))
            }
        }
    }

    func downloadImage(url: URL, completion: @escaping (Result<Data, PlayerError>) -> Void) {
        httpClient.getRequest(url: URLRequest(url: url)) { result in
            switch result {

            case .success(let data):
                if let data {
                    completion(.success(data))
                } else {
                    completion(.failure(.noImageDataDownloaded))
                }

            case .failure(_):
                completion(.failure(.failedImageDownloadRequest))
            }
        }
    }

}
