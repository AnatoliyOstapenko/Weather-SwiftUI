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
                MainWeatherStatusView(imageName: weatherViewModel.isDarkMode ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: weatherViewModel.weatherList.first?.temp ?? 0)
                
                
                HStack(spacing: 20) {
                    WeaterDayView(day: "TUE", imageName: "cloud.sun.fill", temperature: 17)
                    WeaterDayView(day: "WED", imageName: "sun.max.fill", temperature: 18)
                    WeaterDayView(day: "THU", imageName: "wind", temperature: 22)
                    WeaterDayView(day: "FRI", imageName: "sunset.fill", temperature: 23)
                    WeaterDayView(day: "SAT", imageName: "cloud.bolt.rain.fill", temperature: 19)
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
                .font(.system(size: 16, weight: .bold))

            Image(systemName: imageName)
                .resizable()
                .frame(width: 45, height: 40)
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
            Image(systemName: imageName)
                .resizable()
                .symbolRenderingMode(.multicolor) /// provide original color'
                .aspectRatio(contentMode: .fit) /// fit in frame, fill out of frame
                .frame(width: 180, height: 180) /// put the last one
            Text("\(temperature)°C")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .medium))
        }
        .padding(.bottom, 40)
    }
}
