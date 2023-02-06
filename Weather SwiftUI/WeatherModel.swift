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
    let data: Int /// check if you can change it with Data in the future
    let main: Main
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case main, weather
        case data = "dt"
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
    let data: Int
    let temp: Int
    let icon: String
    
    init(data: Int, temp: Int, icon: String) {
        self.data = data
        self.temp = temp
        self.icon = icon
    }
}
