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
    let settingsService = SettingsService.shared
    var rocket: RocketModel
    
    init(rocket: RocketModel) {
        self.rocket = rocket
    }
    
    func saveMode(forSetting setting: Setting, mode: Mode) {
        settingsService.saveMode(forSetting: setting, mode: mode)
    }
    
    func getMode(forSetting setting: Setting) -> Mode? {
        settingsService.getMode(forSetting: setting)
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
    
    func collectionViewItemValue(for indexPath: IndexPath, mode: Mode) -> Double {
        switch mode {
        case .m:
            switch indexPath.item {
            case 0:
                return rocket.height.meters
            case 1:
                return rocket.diameter.meters
            default:
                return 0
            }
        case .ft:
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
