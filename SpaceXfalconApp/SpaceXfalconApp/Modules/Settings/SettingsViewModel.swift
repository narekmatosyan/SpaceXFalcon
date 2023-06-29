//
//  SettingsViewModel.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 21.06.23.
//

import Foundation
import UIKit
import SnapKit

enum Setting: String {
    case height = "Высота"
    case diameter = "Диаметр"
    case mass = "Масса"
    case thrust = "Полезная нагрузка"
}

class SettingsViewModel {
    let settingsService = SettingsService.shared
    
    func saveMode(forSetting setting: Setting, mode: Mode) {
        settingsService.saveMode(forSetting: setting, mode: mode)
    }
    
    func getMode(forSetting setting: Setting) -> Mode? {
        settingsService.getMode(forSetting: setting)
    }
}
