//
//  WeatherButton.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 27.01.2023.
//

import SwiftUI



struct WeatherButtonView: View {
    var textButton: String
    var textColor: Color
    var buttonBackground: AnyView
    
    var body: some View {
        VStack {
            Text(textButton)
                .foregroundColor(textColor)
                .frame(width: 280, height: 50)
                .background(buttonBackground)
                .cornerRadius(10)
                .font(.system(size: 20, weight: .bold))
        }
    }
}

struct ButtonLightBackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.cyan, .accentColor, .cyan]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
    }
}

struct ButtonDarkBackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.gray, Color("graphite"), .gray]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
    }
}
