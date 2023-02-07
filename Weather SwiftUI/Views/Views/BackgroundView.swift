//
//  BackgroundView.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 07.02.2023.
//

import SwiftUI

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

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(isDarkMode: false)
    }
}
