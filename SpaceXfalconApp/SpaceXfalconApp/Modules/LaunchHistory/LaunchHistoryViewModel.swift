//
//  LaunchHistoryViewModel.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 14.06.23.
//

import UIKit
import Alamofire

class LaunchHistoryViewModel {
    private let spaceXDataLaunches = SpaceXService.shared
    var launches: [LaunchModel] = []
    
    func fetchLaunches(completion: @escaping (Result<[LaunchModel],Error>) -> Void) {
        SpaceXService.shared.fetchLaunches { [weak self] result in
            switch result {
            case .success(let launches):
                self?.launches = launches
                completion(.success([]))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func rocketLaunchSafety(at index: Int) -> LaunchModel? {
        guard index >= 0 && index < launches.count else { return nil }
        
        return launches[index]
    }
}
