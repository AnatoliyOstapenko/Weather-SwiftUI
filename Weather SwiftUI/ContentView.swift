//
//  ContentView.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 27.01.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            VStack {
                Text("Kyiv, Ukraine")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .medium))
                    .padding()
                
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .resizable()
                        .renderingMode(.original) /// provide original color
                        .aspectRatio(contentMode: .fit) /// fit in frame, fill out of frame
                        .frame(width: 180, height: 180) /// put the last one
                    Text("0°C")
                        .foregroundColor(.white)
                        .font(.system(size: 70, weight: .medium))
                }
                .padding(.bottom, 40)
                
                HStack(spacing: 20) {
                    WeaterDayView(day: "TUE", imageName: "cloud.sun.fill", temperature: 17)
                    WeaterDayView(day: "WED", imageName: "sun.max.fill", temperature: 18)
                    WeaterDayView(day: "THU", imageName: "wind", temperature: 22)
                    WeaterDayView(day: "FRI", imageName: "sunset.fill", temperature: 23)
                    WeaterDayView(day: "SAT", imageName: "cloud.bolt.rain.fill", temperature: 19)
                }
                
                Spacer()
                
                Button {
                    print("tap")
                    
                } label: {
                    Text("Change Day of Time")
                    
                        .foregroundColor(.white)
                        .frame(width: 280, height: 50)
                        .background(ButtonBackgroundView())
                        .cornerRadius(10)
                        .font(.system(size: 20, weight: .bold))
                }

                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ButtonBackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.cyan, .accentColor, .cyan]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
    }
}
