//
//  NetworkingManager.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//

import Alamofire

class HTTPClient: HTTPClientProtocol {

    func getRequest(url: URLRequest, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).validate().response { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
