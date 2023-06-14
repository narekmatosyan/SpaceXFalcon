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
    
    func tableViewSectionValue(for indexPath: IndexPath) -> String {
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
    
    func collectionViewItemValue(for indexPath: IndexPath, measureSystem: MeasureSystem) -> Double {
        switch measureSystem {
        case .meter:
            switch indexPath.item {
            case 0:
                return rocket.height.meters
            case 1:
                return rocket.diameter.meters
            default:
                return 0
            }
        case .feet:
            switch indexPath.item {
            case 0:
                return rocket.height.feet
            case 1:
                return rocket.diameter.feet
            default:
                return 0
            }
        case .kg:
            return Double(rocket.mass.kg)
        case .lb:
            return Double(rocket.mass.lb)
        case .kN:
            return rocket.firstStage.rocketThrust?.kN ?? 0
        case .lbf:
            return rocket.firstStage.rocketThrust?.kN ?? 0
        }
    }
}

extension RocketViewModel {
    enum MeasureSystem {
        case meter
        case feet
        case kg
        case lb
        case kN
        case lbf
    }
}
