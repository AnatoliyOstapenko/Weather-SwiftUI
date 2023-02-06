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
            VStack {
                CityTextView(cityName: "Kyiv, Ukraine")
                
                MainWeatherStatusView(imageName: weatherViewModel.weatherList.first?.icon ?? "01d",
                                      temperature: weatherViewModel.weatherList.first?.temp ?? 23)
                
                HStack(spacing: 20) {
                    ForEach(weatherViewModel.weatherList) { weather in
                        WeaterDayView(day: weather.date,
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

struct WeaterDayView: View {
    var day: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(day)
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.bold)
                .minimumScaleFactor(0.6)

//            Image(systemName: imageName)
            WeatherIconView(icon: imageName)
                .aspectRatio(contentMode: .fit)
                .frame(width: 45)
                .symbolRenderingMode(.multicolor)
            
            Text("\(temperature)°C")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
        }
    }
}

struct BackgroundView: View {
    var isDarkMode: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isDarkMode ? .gray : .blue,
                                                isDarkMode ? .black : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .foregroundColor(.white)
            .font(.system(size: 32, weight: .medium))
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            
            WeatherIconView(icon: imageName)
                .aspectRatio(contentMode: .fit)
                .frame(width: 180)
                .symbolRenderingMode(.multicolor)
                                
            Text("\(temperature)°C")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .medium))
        }
        .padding(.bottom, 40)
    }
}
