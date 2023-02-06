//
//  WeatherViewModel.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 06.02.2023.
//

import SwiftUI

final class WeatherViewModel: ObservableObject {
    
    @Published var weatherList: [WeatherData] = []
    @Published var isDarkMode = false
    
    func setWeatherData(city: String) {
        NetworkManager.shared.getWeatherData(city: city) { [weak self] weather in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch weather {
                case .success(let weatherList):
                    
                    weatherList.forEach { array in
                        let weatherData = WeatherData(data: array.data,
                                                      temp: array.main.temp.doubleToInt,
                                                      icon: array.weather.first?.icon ?? "")
                        self.weatherList.append(weatherData)
                    }
                    
                case .failure(let error):
                    print("Error: \(error.hashValue)")
                }
            }
        }
    }
}

private extension Double {
    var doubleToInt: Int { Int(self) }
}
