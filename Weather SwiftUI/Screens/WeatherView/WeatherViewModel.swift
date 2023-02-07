//
//  WeatherViewModel.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 06.02.2023.
//

import SwiftUI

final class WeatherViewModel: ObservableObject {
    
    @Published var weatherList: [WeatherData] = []
    @Published var alertItem: AlertModel?
    @Published var isDarkMode = false
    @Published var isLoading = false
    
    func setWeatherData(city: String) {
        isLoading = true
        NetworkManager.shared.getWeatherData(city: city) { [weak self] weather in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.isLoading = true
                switch weather {
                case .success(let weatherList):
                    weatherList.forEach {
                        let weatherData = WeatherData(date: $0.date.dayOfWeek,
                                                      temp: $0.main.temp.doubleToInt,
                                                      icon: $0.weather.first?.icon ?? "")
                        
                        /// openweathermap provide colection weather data, where there are a lot date dublicates
                        /// for instance: 2023-02-07, 2023-02-07, 2023-02-07, 2023-02-08
                        /// it is necessary to check whether the date already exists in the Array.
                        
                        if !self.weatherList.contains(where: { $0.date == weatherData.date }) {
                            self.weatherList.append(weatherData)
                        }
                    }
                case .failure(let error):
                    self.errorHandler(error)
                }
            }
        }
    }
    
    private func errorHandler(_ error: NetworkErrors) {
        switch error {
        case .invalidURL:
            self.alertItem = AlertMock.invalidURL
        case .invalidResponse:
            self.alertItem = AlertMock.invalidResponse
        case .invalidData:
            self.alertItem = AlertMock.invalidData
        case .invalidTask:
            self.alertItem = AlertMock.invalidTask
        case .unableToComplete:
            self.alertItem = AlertMock.unableToComplete
        }
    }
}

private extension Double {
    var doubleToInt: Int { Int(self) }
}
private extension Int {
    var dayOfWeek: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "EEEE"
        let date = Date(timeIntervalSince1970: Double(self)) /// don't use timeIntervalSinceReferenceDate - invalid data
        let string = dateFormatter.string(from: date)
        return string.prefix(3).capitalized /// cut week day to 3 characters
    }
}



