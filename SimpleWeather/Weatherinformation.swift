//
//  Weatherinformation.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/03/03.
//

// 현재 날씨 정보 저장 파일
import Foundation

struct WeatherInformation: Codable {
    // Codable : 자신을 변환하거나 외부 표현으로 변환 가능한 타입을 의미함
    // * 외부 표현 : json과 같은 type, 인/디코더를 모두 가능한 타입
    
    // weather api json data에서 필요한 프로퍼티만 구조체에 정의
    let weather: [Weather]
    let temp: Temp
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case weather
        case temp = "main"
        case name
    }
}

struct Weather: Codable {
    // json 키와 프로퍼티로 정의한 이름과 타입이 일치해야함 (따로 정의하면 다른 이름도 가능)
    let id: Int
    let main: String
    let description: String
    let icon: String
}

// main에 접근하기
struct Temp: Codable {
    let temp: Double
    let feelsLike: Double
    let minTemp: Double
    let maxTemp: Double
    
    // 이름 달라도 매칭되도록 만들기
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
}
