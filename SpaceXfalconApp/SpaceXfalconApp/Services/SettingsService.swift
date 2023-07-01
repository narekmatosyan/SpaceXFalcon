//
//  SettingsService.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 28.06.23.
//

import Foundation

class SettingsService {
    static let shared = SettingsService()
    
    let userDefaults = UserDefaults.standard
    
    func saveMode(forSetting setting: Setting, mode: Mode) {
        userDefaults.set(mode.rawValue, forKey: setting.rawValue)
    }
    
    func getMode(forSetting setting: Setting) -> Mode? {
        let stringMode = userDefaults.object(forKey: setting.rawValue) as? String
        return Mode(rawValue: stringMode ?? "")
    }
}
