//
//  NetworkManager.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 06.02.2023.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    private let initialURLString = "https://api.openweathermap.org/data/2.5/forecast?q="
    
    func getWeatherData(city: String, completion: @escaping(Result<WeatherModel, NetworkErrors>) -> Void) {
        let stringURL = initialURLString + "&units=metric&appid=" + Password.key
        print(stringURL)
        
        guard let url = URL(string: stringURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard error == nil else {
                completion(.failure(.invalidTask))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            print("Status code of HTTP response: \(response.statusCode)")
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let weatherData = try JSONDecoder().decode(WeatherModel.self, from: data)
                completion(.success(weatherData))
            } catch { completion(.failure(.unableToComplete)) }
        }
        task.resume()
    }
}
