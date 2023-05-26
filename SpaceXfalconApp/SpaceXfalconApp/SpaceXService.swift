////
////  SpaceXService.swift
////  SpaceXfalconApp
////
////  Created by Narek Matosyan on 16.05.23.
////

import Foundation
import Alamofire

class SpaceXService {
    func fetchRockets(completion: @escaping (Result<[RocketModel], Error>) -> Void) {
        guard let url = URL(string: "https://api.spacexdata.com/v4/rockets") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        AF.request(url, method: .get).responseDecodable(of: [RocketModel].self) { data in
            switch data.result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
