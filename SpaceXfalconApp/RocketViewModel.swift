//
//  RocketViewModel.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 16.05.23.
//

import Foundation
import Alamofire

class RocketViewModel {
    private let spaceXService = SpaceXService()
    var rockets: [RocketModel] = []
    
    func fetchRockets(completion: @escaping (Result<Void, Error>) -> Void) {
        spaceXService.fetchRockets { [weak self] result in
            switch result {
            case .success(let rockets):
                self?.rockets = rockets
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getRocketSafety(at index: Int) -> RocketModel? {
        guard index >= 0 && index < rockets.count else {
            return nil
        }
        return rockets[index]
    }
}
