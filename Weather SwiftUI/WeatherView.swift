//
//  ContentView.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 27.01.2023.
//

import SwiftUI

struct WeatherView: View {
    
    @State var isDarkMode = false
    
    var body: some View {
        ZStack {
            BackgroundView(isDarkMode: $isDarkMode)
            VStack {
                CityTextView(cityName: "Kyiv, Ukraine")
                MainWeatherStatusView(imageName: isDarkMode ? "moon.stars.fill" : "cloud.sun.fill", temperature: 22)
                
                
                HStack(spacing: 20) {
                    WeaterDayView(day: "TUE", imageName: "cloud.sun.fill", temperature: 17)
                    WeaterDayView(day: "WED", imageName: "sun.max.fill", temperature: 18)
                    WeaterDayView(day: "THU", imageName: "wind", temperature: 22)
                    WeaterDayView(day: "FRI", imageName: "sunset.fill", temperature: 23)
                    WeaterDayView(day: "SAT", imageName: "cloud.bolt.rain.fill", temperature: 19)
                }
                
                Spacer()
                
                Button {
                    isDarkMode.toggle()
                } label: {
                    WeatherButtonView(textButton: "Change Day Time",
                                      textColor: .white,
                                      buttonBackground: isDarkMode ? AnyView(ButtonDarkBackgroundView()): AnyView(ButtonLightBackgroundView()))
                }

                Spacer()
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
                .font(.system(size: 16, weight: .medium))
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°C")
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .medium))
        }
    }
}

struct BackgroundView: View {
    @Binding var isDarkMode: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isDarkMode ? .gray : .blue,
                                                isDarkMode ? .black : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
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
                .renderingMode(.original) /// provide original color
                .aspectRatio(contentMode: .fit) /// fit in frame, fill out of frame
                .frame(width: 180, height: 180) /// put the last one
            Text("\(temperature)°C")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .medium))
        }
        .padding(.bottom, 40)
    }
}
