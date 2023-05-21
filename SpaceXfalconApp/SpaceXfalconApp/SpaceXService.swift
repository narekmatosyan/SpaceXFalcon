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
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "Empty response", code: 0, userInfo: nil)))
                return
            }
            do {
                let rockets = try JSONDecoder().decode([RocketModel].self, from: data)
                completion(.success(rockets))
            } catch {
                completion(.failure(error))
            }
            
        }
        .resume()
    }
}
