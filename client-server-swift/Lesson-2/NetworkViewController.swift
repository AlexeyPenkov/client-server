//
//  NetworkViewController.swift
//  client-server-swift
//
//  Created by Алексей Пеньков on 25.05.2021.
//

import UIKit
import Alamofire

class NetworkViewController: UIViewController {
    
    let weatherService = WeatherService()

    override func viewDidLoad() {
        super.viewDidLoad()

        //firstRequest()
        
        //secondReques()
        
        //thirdReques()
        
        forthReques()
    }
    
    
    /*
     GET запрос с помощью URL
     */
    func firstRequest() {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        
        guard let url = URL(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1") else { return }
        //let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print(json as Any)
        }
        task.resume()
    }
    
    
    /*
     Конструирование URL
     
     Настраиваем запрос - URLRequest
     
     POST-запрос - создание объектаб параметры создаются через URL
     */
    func secondReques() {
        
        let configaration = URLSessionConfiguration.default
        let session = URLSession(configuration: configaration)
        
        //конструктор URL
        var urlConstructor = URLComponents()
        //устанавливаем схему
        urlConstructor.scheme = "http"
        //устанавливаем хост
        urlConstructor.host = "jsonplaceholder.typicode.com"
        //Путь
        urlConstructor.path = "/posts"
        
        //параметры запроса
        
        urlConstructor.queryItems = [
            URLQueryItem(name: "title", value: "foo"),
            URLQueryItem(name: "body", value: "bar"),
            URLQueryItem(name: "userID", value: "1")
        ]
        
        var request = URLRequest(url: urlConstructor.url!)
        request.httpMethod = "POST"
        
        let task = session.dataTask(with: request) { data, response, error in
            let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            print(json as Any)
        }
        
        task.resume()
    }
    
    
    /*
     GET-запрос с URL
     */
    func thirdReques() {
        AF.request("http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1").responseJSON(completionHandler: { response in
            print(response.value as Any)
        })
    }
    
    func forthReques() {
        weatherService.loadWeatherData(city: "Irkutsk")
    }
    
    func fifthReques() {
        
    }
}
