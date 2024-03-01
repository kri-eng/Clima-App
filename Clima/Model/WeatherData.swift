//
//  WeatherData.swift
//  Clima
//
//  Created by Krish Patel on 2/18/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Weather: Codable {
    let description: String
    let id: Int
}

struct Main: Codable {
    let temp: Double
}
