//
//  WeatherDayView.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 07.02.2023.
//

import SwiftUI

struct WeatherDayView: View {
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

struct WeatherDayView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDayView(imageName: "photo", temperature: 24)
    }
}
