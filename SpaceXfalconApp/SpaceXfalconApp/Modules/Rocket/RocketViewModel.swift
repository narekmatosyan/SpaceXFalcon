//
//  RocketViewModel.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 16.05.23.
//

import Foundation
import Alamofire
import UIKit

class RocketViewModel {
    var rocket: RocketModel
    
    init(rocket: RocketModel) {
        self.rocket = rocket
    }
    
    func viewDidLoad() {
        
    }
    
    func getSectionValue(for indexPath: IndexPath) -> String {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return rocket.rocketFirstFlight.formatFirstFlightDate()
            case 1:
                return rocket.rocketLaunchCountry
            case 2:
                return String(rocket.costPerLaunch)
            default:
                return ""
            }
        case 1:
            switch indexPath.row {
            case 1:
                return String(rocket.firstStage.rocketEngines)
            case 2:
                return String(rocket.firstStage.rocketFuelAmount)
            case 3:
                return String(rocket.firstStage.rocketBurnTime ?? 0)
            default:
                return ""
            }
        case 2:
            switch indexPath.row {
            case 1:
                return String(rocket.secondStage.rocketEngines)
            case 2:
                return String(rocket.secondStage.rocketFuelAmount)
            case 3:
                return String(rocket.secondStage.rocketBurnTime ?? 0)
            default:
                return ""
            }
        default:
            return ""
        }
    }
}
