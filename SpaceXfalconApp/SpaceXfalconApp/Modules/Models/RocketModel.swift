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
    let height: Height
    let diameter: Diameter
    let mass: Mass
        
    enum CodingKeys: String, CodingKey {
        case rocketName = "name"
        case costPerLaunch = "cost_per_launch"
        case rocketFirstFlight = "first_flight"
        case rocketLaunchCountry = "country"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case flickrImages = "flickr_images"
        case height = "height"
        case diameter = "diameter"
        case mass = "mass"
    }
}

struct RocketStage: Codable {
    let rocketEngines: Int
    let rocketFuelAmount: Double
    let rocketBurnTime: Int?
    let rocketThrust: Thrust?
    
    enum CodingKeys: String, CodingKey {
        case rocketEngines = "engines"
        case rocketFuelAmount = "fuel_amount_tons"
        case rocketBurnTime = "burn_time_sec"
        case rocketThrust = "thrust_vacuum"
    }
}

struct Height: Codable {
    let meters: Double
    let feet: Double
}

struct Diameter: Codable {
    let meters: Double
    let feet: Double
}

struct Mass: Codable {
    let kg: Int
    let lb: Int
}

struct Thrust: Codable {
    let kN: Double
    let lbf: Double
}
