//
//  RocketAttributesModel.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 04.05.23.
//

import Foundation

struct FirstFlight: Codable {
    let dateOfFirstFlight: String
}

struct Place: Codable {
    let country: String
}
struct CostPerLaunch: Codable {
    let launchCost: String
}
