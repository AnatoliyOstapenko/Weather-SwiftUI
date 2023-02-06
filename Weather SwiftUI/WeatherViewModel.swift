//
//  WeatherViewModel.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 06.02.2023.
//

import SwiftUI

final class WeatherViewModel: ObservableObject {
    
    @Published var weatherList: Set<WeatherData> = [] /// Array was changed with Set to avoid date dublicates
    @Published var isDarkMode = false
    
    func setWeatherData(city: String) {
        NetworkManager.shared.getWeatherData(city: city) { [weak self] weather in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch weather {
                case .success(let weatherList):
                    weatherList.forEach {
                        let weatherData = WeatherData(date: $0.date.dayOfWeek,
                                                      temp: $0.main.temp.doubleToInt,
                                                      icon: $0.weather.first?.icon ?? "")
                        
                        /// openweathermap provide colection weather data, where there are a lot date dublicates
                        /// for instance: 2023-02-07, 2023-02-07, 2023-02-07, 2023-02-08
                        /// it is necessary to check whether the date already exists in the Set.
                        
                        if !self.weatherList.contains(where: { $0.date == weatherData.date }) {
                            self.weatherList.insert(weatherData)
                        }
                        
                    }
                    print(self.weatherList)
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
private extension Int {
    var dayOfWeek: String {
        let dateFormatter = DateFormatter()
        let date = Date(timeIntervalSinceReferenceDate: Double(self))
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date).capitalized
    }
}



