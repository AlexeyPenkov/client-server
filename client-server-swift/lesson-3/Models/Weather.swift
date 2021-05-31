// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try? newJSONDecoder().decode(Weather.self, from: jsonData)

import Foundation

// MARK: - Weather
struct WeatherResponse: Codable {
    let message: Int
    let cod: String
    let cnt: Int
    let list: [Weather]
    let city: City
}

// MARK: - City
struct City: Codable {
    let sunset: Int
    let country: String
    let id: Int
    let coord: Coord
    let population, timezone, sunrise: Int
    let name: String
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double
}

// MARK: - List
struct Weather: Codable {
    let clouds: Clouds
    let wind: Wind
    let dt: Int
    let dtTxt: String
    let main: MainClass
    let weather: [WeatherElement]
    let pop: Double
    let sys: Sys
    let visibility: Int
    let rain: Rain?

    enum CodingKeys: String, CodingKey {
        case clouds, wind, dt
        case dtTxt = "dt_txt"
        case main, weather, pop, sys, visibility, rain
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - MainClass
struct MainClass: Codable {
    let humidity: Int
    let feelsLike, tempMin, tempMax, temp: Double
    let pressure: Int
    let tempKf: Double
    let seaLevel, grndLevel: Int

    enum CodingKeys: String, CodingKey {
        case humidity
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case temp, pressure
        case tempKf = "temp_kf"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let id: Int
    let main: MainEnum
    let icon: String
    let weatherDescription: Description

    enum CodingKeys: String, CodingKey {
        case id, main, icon
        case weatherDescription = "description"
    }
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}
