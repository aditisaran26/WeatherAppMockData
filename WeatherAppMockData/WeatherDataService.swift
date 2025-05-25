//
//  WeatherDataService.swift
//  WeatherAppMockData
//
//  Created by Aditi Ojha on 20/05/25.
// singleton pattern for the data service to maintain a single source of truth

import Foundation


class WeatherDataService {
    
    static let shared = WeatherDataService() //  Creates a singleton instance of WeatherDataService.So, throughout your app, you access the same data like this: WeatherDataService.shared
    
    private init() {} //Prevents other classes from creating instances. Only one shared instance can exist.
    
    private var cities: [City] = [                         //Holds an array of city objects.
        City(name: "New York", isFavourite: false),
        City(name: "London", isFavourite: false),
        City(name: "Tokyo", isFavourite: false),
        City(name: "Paris", isFavourite: false),
        City(name: "Sydney", isFavourite: false),
        City(name: "Berlin", isFavourite: false),
        City(name: "Toronto", isFavourite: false),
        City(name: "Dubai", isFavourite: false),
        City(name: "Mumbai", isFavourite: false),
        City(name: "Singapore", isFavourite: false),
    ]
    
    private var weatherData: [String: WeatherDetails] = [            //  Dictionary mapping city names to their weather data.
        "New York": WeatherDetails(temperature: 22, condition: "Partly Cloudy",time: "10:00 AM", highPressure: 65, lowPressure: 12),
        "London": WeatherDetails(temperature: 18, condition: "Rainy",time: "10:00 AM", highPressure: 65, lowPressure: 12),
        "Tokyo": WeatherDetails(temperature: 28, condition: "Sunny",time: "10:00 AM", highPressure: 65, lowPressure: 12),
        "Paris": WeatherDetails(temperature: 23, condition: "Clear",time: "10:00 AM", highPressure: 65, lowPressure: 12),
        "Sydney": WeatherDetails(temperature: 26, condition: "Sunny",time: "10:00 AM", highPressure: 65, lowPressure: 12),
        "Berlin": WeatherDetails(temperature: 19, condition: "Cloudy",time: "10:00 AM", highPressure: 65, lowPressure: 12),
        "Toronto": WeatherDetails(temperature: 17, condition: "Cloudy",time: "10:00 AM", highPressure: 65, lowPressure: 12),
        "Dubai": WeatherDetails(temperature: 38, condition: "Hot",time: "10:00 AM", highPressure: 65, lowPressure: 12),
        "Mumbai": WeatherDetails(temperature: 32, condition: "Humid",time: "10:00 AM", highPressure: 65, lowPressure: 12),
        "Singapore": WeatherDetails(temperature: 30, condition: "Thunderstorm",time: "10:00 AM", highPressure: 65, lowPressure: 12),
    ]
}

extension WeatherDataService {
    func getAllCities() -> [City] {
        return cities.sorted {
            $0.name < $1.name
        }
    }

    func getWeatherData(for cityName: String) -> WeatherDetails? {
        return weatherData[cityName]
    }
    
    func toggelFavourite(for cityName: String) {
        //This is optional binding. If a matching city is found, the index is stored in the index variable and the code inside the if block executes. If no city with the name exists, the block is skipped — this prevents a crash.
        //This searches the cities array for the first city whose name matches the cityName passed as a parameter.It returns the index of that city in the array if found, otherwise nil.
        if let index = cities.firstIndex(where: { $0.name == cityName }) {
            //This line accesses the city at the found index and toggles its isFavorite value.
            cities[index].isFavourite.toggle()
        }
    }
    
    func isCityFavourite(cityName: String) -> Bool {
        return cities.first(where: {$0.name == cityName})?.isFavourite ?? false
    }
    
}



/*
 // return full list of city
 func getCities() -> [City] { //takes no parameter and Return type: [City] (an array of City objects). Why an array? This returns all cities, so naturally it’s a collection of many cities — hence, an array
    return cities
 }
 
 // 2. Return single item
 func getCityDetails(name: String) -> City? {  return just one city, the one whose name matches the parameter. thats why not [City]
    return cities.first { $0.name == name }   //Checks if the city's name equals the name passed into the function.
 }
 
 // 3. Return related data
 func weatherData(for cityName: String) -> WeatherDetails? {
    return weatherData[cityName]
 }
 
 
 
 
 */
