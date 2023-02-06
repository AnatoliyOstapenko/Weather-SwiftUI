//
//  WeatherIconView.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 07.02.2023.
//

import SwiftUI

final class WeatherIconViewModel: ObservableObject {
    
    @Published var image: Image?
    
    func setImage(icon: String) {
        DispatchQueue.global(qos: .utility).async {
            NetworkManager.shared.downloadImage(icon: icon) { [weak self] uiImage in
                guard let self = self, let uiImage = uiImage else { return }
                DispatchQueue.main.async {
                    self.image = Image(uiImage: uiImage)
                }
            }
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        self.image?.resizable() ?? Image(systemName: "photo").resizable()
    }
}

struct WeatherIconView: View {
    
    @StateObject var weatherIconViewModel = WeatherIconViewModel()
    let icon: String
    
    var body: some View {
        RemoteImage(image: weatherIconViewModel.image)
            .onAppear {
                weatherIconViewModel.setImage(icon: icon)
            }
    }
}
