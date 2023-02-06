//
//  WeatherModel.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 06.02.2023.
//

import Foundation

struct WeatherModel: Codable {
    let list: [WeatherList]
}

struct WeatherList: Codable {
    let main: Main
    let weather: [Weather]
    let date: Int
    
    enum CodingKeys: String, CodingKey {
        case main, weather
        case date = "dt"
    }
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let icon: String
}

// Supplementary struct
struct WeatherData: Codable {
    let date: String
    let temp: Int
    let icon: String
    
    init(date: String, temp: Int, icon: String) {
        self.date = date
        self.temp = temp
        self.icon = icon
    }
}


extension WeatherData: Equatable {
    /// conform Equatable to find date dublicats
    static func == (lhs: WeatherData, rhs: WeatherData) -> Bool {
        return lhs.date == rhs.date
    }
}
