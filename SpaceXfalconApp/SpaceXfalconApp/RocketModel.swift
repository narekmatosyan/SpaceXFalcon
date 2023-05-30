//
//  RocketModel.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 28.04.23.
//

import Foundation
import Alamofire

struct RocketModel: Codable {
    let rocketName: String
    let costPerLaunch: Int
    let firstStage: RocketStage
    let secondStage: RocketStage
    let flickrImages: [String]
    let rocketFirstFlight: String
    let rocketLaunchCountry: String
    
    enum CodingKeys: String, CodingKey {
        case rocketName = "name"
        case costPerLaunch = "cost_per_launch"
        case rocketFirstFlight = "first_flight"
        case rocketLaunchCountry = "country"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case flickrImages = "flickr_images"
    }
}

struct RocketStage : Codable {
    let rocketEngines: Int
    let rocketFuelAmount: Double
    let rocketBurnTime: Int?
    
    enum CodingKeys: String, CodingKey {
        case rocketEngines = "engines"
        case rocketFuelAmount = "fuel_amount_tons"
        case rocketBurnTime = "burn_time_sec"
    }
}
