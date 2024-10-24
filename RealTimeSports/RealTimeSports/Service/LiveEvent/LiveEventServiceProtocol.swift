//
//  LiveEventServiceProtocol.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//

protocol LiveEventServiceProtocol {

    func fetchAllLiveEvents(completion: @escaping (Result<[LiveEventResponse], LiveEventError>) -> Void)

}
