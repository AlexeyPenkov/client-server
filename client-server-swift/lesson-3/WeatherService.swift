//
//  WeatherService.swift
//  client-server-swift
//
//  Created by Алексей Пеньков on 25.05.2021.
//

import Foundation
import Alamofire

final class WeatherService {
    
    // базовый URL сервиса
    private let baseUrl = "http://api.openweathermap.org"
    // ключ для доступа к сервису
    private let apiKey = "92cabe9523da26194b02974bfcd50b7e"
    
    
    //MARK:- Public
    
    // метод для загрузки данных, в качестве аргументов получает город
    func loadWeatherData(city: String){
        
        // путь для получения погоды за 5 дней
        let path = "/data/2.5/forecast"
        
        // параметры, город, единицы измерения градусы, ключ для доступа к сервису
        let params: Parameters = [
                "q": city,
                "units": "metric",
                "appid": apiKey
            ]
            
        // составляем URL из базового адреса сервиса и конкретного пути к ресурсу
        let url = baseUrl+path
            
        // делаем запрос
        AF.request(url, method: .get, parameters: params).responseData{ response in
            guard let data = response.value else { return }
            
            //print(data.prettyJSON as Any)
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            
            let weatherList = weatherResponse?.list
            
            guard let weather = weatherList?.first else {return}
            
            print(weather.dtTxt)
            
            //print(weather)
            }
    }
}
