//
//  WeaterWeekView.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 07.02.2023.
//

import SwiftUI

struct WeaterWeekView: View {
    
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

struct WeaterWeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeaterWeekView(day: "MON", imageName: "photo", temperature: 24)
    }
}
