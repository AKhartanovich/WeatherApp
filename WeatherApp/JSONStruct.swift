//
//  JSONStruct.swift
//  WeatherApp
//
//  Created by MacBook on 20.01.21.
//

import Foundation

struct WeatherResponse: Codable {
    let lat: Float
    let lon: Float
    let timezone: String
    let timezone_offset: Int
    let current: Current
    let hourly: [Hourly]
    let daily: [Daily]
}

struct Current: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let wind_speed: Double
    let wind_deg: Int
    let weather: [CurrentWeather]
}

struct CurrentWeather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Hourly: Codable {
    let dt: Int
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let wind_speed: Double
    let wind_deg: Int
    let weather: [HourlyWeather]
}

struct HourlyWeather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Daily: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: DailyTemp
    let feels_like: Dailyfeels_like
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let wind_speed: Double
    let wind_deg: Int
    let weather: [DailyWeather]
    let clouds: Int
    let pop: Double
//    let snow: Double
    let uvi: Double
}

struct DailyTemp: Codable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double
}

struct Dailyfeels_like: Codable {
    let day: Double
    let night: Double
    let eve: Double
    let morn: Double
}

struct DailyWeather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}


