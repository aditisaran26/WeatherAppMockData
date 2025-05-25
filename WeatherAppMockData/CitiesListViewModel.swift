//
//  CitiesListViewModel.swift
//  WeatherAppMockData
//
//  Created by Aditi Ojha on 23/05/25.
// ViewModel: the mediator between model and view.

import Foundation

//return the cityName, number of cities, isCityFavourite, toggel the fav city and fetchWeatherDetails of the cities
class CitiesListViewModel {
    
    private var weatherServiceData = WeatherDataService.shared // Stores a reference to the singleton data service to fetch data.
    
    /*private var cities = weatherService.getAllCities()
     You’d need to manually refresh the array every time the data changes.With a computed property, it always reflects the latest data from the source.
     
     A computed property is a property that does not store a value. Instead, it calculates and returns a value on the fly each time it's accessed.
     
     var propertyName: PropertyType {
     // code that returns a value
     return someCalculatedValue
     }
     */
    
    // Computed property that exposes the city list.
    var cities: [City] {
        return weatherServiceData.getAllCities()
    }
    
    
    // Returns the name of the city at a given row index.
    func cityName(at index: Int) -> String {
        return cities[index].name
    }
    
    // Fetches weather details for the city at a given index.
    func fetchWeatherDetails(for index: Int) -> WeatherDetails? {
        let city = cities[index]
        return weatherServiceData.getWeatherData(for: city.name)
    }
    
    func numberOfCities() -> Int {
        return cities.count
    }
    
    // Method to check if city is favourite
    func isCityFavourite(at index: Int) -> Bool {
        let cityName = cities[index].name
        return weatherServiceData.isCityFavourite(cityName: cityName)
    }
    
    // Method to toggle favourite status
    func toggleFavourite(at index: Int) {
        let cityName = cities[index].name
        return weatherServiceData.toggelFavourite(for: cityName)
    }
}
