//
//  NetworkManager.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 06.02.2023.
//

import Foundation
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    private let initialURLString = "https://api.openweathermap.org/data/2.5/forecast?q="
    private let initialIconURL = "https://openweathermap.org/img/wn/"
    
    func getWeatherData(city: String, completion: @escaping(Result<[WeatherList], NetworkErrors>) -> Void) {
        let stringURL = initialURLString + city + "&units=metric&appid=" + Password.key
        
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
                completion(.success(weatherData.list))
                
            } catch { completion(.failure(.unableToComplete)) }
        }
        task.resume()
    }
    
    func downloadImage(icon: String, completion: @escaping(UIImage?) -> Void) {
        let imageURL = initialIconURL + icon + "@2x.png"
        guard let url = URL(string: imageURL) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil, let data = data, let image = UIImage(data: data) else { return }
            completion(image)
        }
        task.resume()
    }
}
