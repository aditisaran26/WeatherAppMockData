//
//  WeatherModel.swift
//  WeatherAppMockData
//
//  Created by Aditi Ojha on 20/05/25.
// The City model has the favorite state, and WeatherDetails holds all weather information

import Foundation


struct City {
    let name: String
    var isFavourite: Bool 
}

struct WeatherDetails {
    let temperature: Int
    let condition: String
    let time: String
    let highPressure: Int
    let lowPressure: Int
}
