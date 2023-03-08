//
//  CityCovidOverview.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/03/07.
//

// MARK: 응답받은 josn 데이터를 mapping 할 수 있는 데이터 구조 생성 파일

import Foundation

// 시도명 객체를 매칭하기 위한 구조체
struct CityCovidOverview: Codable {
    let korea: CovidOverview
    let seoul: CovidOverview
    let busan: CovidOverview
    let daegu: CovidOverview
    let incheon: CovidOverview
    let gwangju: CovidOverview
    let daejeon: CovidOverview
    let ulsan: CovidOverview
    let sejong: CovidOverview
    let gyeonggi: CovidOverview
    let gangwon: CovidOverview
    let chungbuk: CovidOverview
    let chungnam: CovidOverview
    let jeonbuk: CovidOverview
    let jeonnam:CovidOverview
    let gyeongbuk: CovidOverview
    let gyeongnam: CovidOverview
    let jeju: CovidOverview
}

// json 에서 시도명 프로퍼티와 동일하게 구조체 생성
struct CovidOverview: Codable {
    let countryName: String
    let newCase: String
    let totalCase: String
    let recovered: String
    let death : String
    let percentage: String
    let newCcase: String
    let newFcase: String
}
