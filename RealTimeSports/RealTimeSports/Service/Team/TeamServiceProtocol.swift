//
//  TeamServiceProtocol.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//
import Foundation
import Alamofire

protocol TeamServiceProtocol {

    func team(id: String, completion: @escaping (Result<Data?, AFError>) -> Void)

}
