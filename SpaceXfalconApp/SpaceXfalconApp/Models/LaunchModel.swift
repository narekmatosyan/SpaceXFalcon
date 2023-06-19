//
//  LaunchModel.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 15.06.23.
//

import Foundation
import Alamofire

struct LaunchModel: Codable {
    let name: String
    let date: String
    let isSuccess: Bool?
    
    enum CodingKeys: String,CodingKey {
        case name = "name"
        case date = "date_utc"
        case isSuccess = "success"
    }
}
