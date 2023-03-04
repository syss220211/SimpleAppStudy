//
//  weatherViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/03/03.
//

import UIKit

class weatherViewController: UIViewController {

    @IBOutlet var cityNameTextField: UITextField!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var weatherDescriptionLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var maxTempLabel: UILabel!
    @IBOutlet var minTempLabel: UILabel!
    @IBOutlet var weatherStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func tapFetchWeatherButton(_ sender: UIButton) {
        if let cityName = self.cityNameTextField.text {
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true) // 버튼 눌리면 키보드 사라짐
        }
    }
    
    func comfigureView(weatherInformation: WeatherInformation) {
        self.cityNameLabel.text = weatherInformation.name
        if let weather = weatherInformation.weather.first {
            self.weatherDescriptionLabel.text = weather.description // 현재 날씨 정보 표시
        }
        self.tempLabel.text = "\(Int(weatherInformation.temp.temp - 273.15))°C"
        self.minTempLabel.text = "최저: \(Int(weatherInformation.temp.minTemp - 273.15))°C"
        self.maxTempLabel.text = "최고: \(Int(weatherInformation.temp.maxTemp - 273.15))°C"
    }
    
    func getCurrentWeather(cityName: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=34024adfab8ad8999430c13c988fea93") else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { [weak self] Data, URLResponse, Error in
            guard let Data = Data, Error == nil else { return }
            let decoder = JSONDecoder()
            guard let weatherInformation = try? decoder.decode(WeatherInformation.self, from: Data) else { return }
            //main thread 사용
            DispatchQueue.main.async {
                self?.weatherStackView.isHidden = false
                self?.comfigureView(weatherInformation: weatherInformation)
            }
            
        }.resume()
    }
}
