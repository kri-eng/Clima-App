//
//  WeatherManager.swift
//  Clima
//
//  Created by Krish Patel on 2/18/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=3c6e8d3a1b21e7b54e76f2504e8352fd&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    //
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    //
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lon=\(longitude)&lat=\(latitude)"
        performRequest(urlString: urlString)
    }
    
    //
    func performRequest(urlString: String) {
        // Create a URL
        if let url = URL(string: urlString) {
            // Create a URLSession
            let session = URLSession(configuration: .default)
            
            // Give session a task
            let task = session.dataTask(with: url) { (data, urlResponse, error) in
                // If error print the error.
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                // else print the data
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        // Need to fire the delegate
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            // Start the task.
            task.resume()
        } else {
            // TO check for error.
            print("Error: Invalid URL - \(urlString)")
        }
    }
    
    //
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
