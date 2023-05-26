//
//  String+RocketFirstFlightDateFormatter.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 25.05.23.
//

import Foundation

extension String {
    func formatFirstFlightDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "d MMMM, yyyy"
        return dateFormatter.string(from: date ?? Date())
    }
}
