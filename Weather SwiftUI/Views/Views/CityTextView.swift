//
//  CityTextView.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 07.02.2023.
//

import SwiftUI

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .foregroundColor(.white)
            .font(.system(size: 32, weight: .medium))
            .padding()
    }
}

struct CityTextView_Previews: PreviewProvider {
    static var previews: some View {
        CityTextView(cityName: "London")
    }
}
