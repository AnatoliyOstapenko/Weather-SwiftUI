//
//  ContentView.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 27.01.2023.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView(isDarkMode: weatherViewModel.isDarkMode)
            if weatherViewModel.isLoading { SpinnerView() }
            VStack {
                CityTextView(cityName: "Kyiv, Ukraine")
                
                WeatherDayView(imageName: weatherViewModel.weatherList.first?.icon ?? "",
                              temperature: weatherViewModel.weatherList.first?.temp ?? 22)
                
                HStack(spacing: 20) {
                    ForEach(weatherViewModel.weatherList) { weather in
                        WeaterWeekView(day: weather.date,
                                      imageName: weather.icon,
                                      temperature: weather.temp)
                    }
                }
                
                Spacer()
                
                Button {
                    weatherViewModel.isDarkMode.toggle()
                } label: {
                    WeatherButtonView(textButton: "Change Day Time",
                                      textColor: .white,
                                      buttonBackground: weatherViewModel.isDarkMode ? AnyView(ButtonDarkBackgroundView()): AnyView(ButtonLightBackgroundView()))
                }
                Spacer()
                
                
            }
            .onAppear {
                weatherViewModel.setWeatherData(city: "kyiv")
            }
            .alert(item: $weatherViewModel.alertItem) { alert in
                Alert(title: alert.title,
                      message: alert.message,
                      dismissButton: alert.dismissButton)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}


