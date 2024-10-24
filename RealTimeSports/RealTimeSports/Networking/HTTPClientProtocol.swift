//
//  HTTPClientProtocol.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//
import Foundation
import Alamofire

protocol HTTPClientProtocol {

    func getRequest(url: URLRequest, completion: @escaping (Result<Data?, AFError>) -> Void)

}
