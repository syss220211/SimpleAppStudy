//
//  CoronaViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/03/05.
//

import UIKit
import Charts
import Alamofire

class CoronaViewController: UIViewController {

    @IBOutlet var totalCaseLabel: UILabel!
    @IBOutlet var newCaseLabel: UILabel!
    @IBOutlet var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCovidOverview { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(result):
                self.configureStackVeiw(koreaCovidOverview: result.korea)
                let covidOverviewList = self.makeCovidOverviewList(cityCovidOverview: result)
                self.configureChatView(covidOverviewList: covidOverviewList)
            case let .failure(error):
                debugPrint("error \(error)")
            }
        }
    }
    
    // 시도별 신규 확진자 수 파이차트에 표시
    func makeCovidOverviewList(
        cityCovidOverview: CityCovidOverview
    ) -> [CovidOverview] {
        return [
            cityCovidOverview.seoul,
            cityCovidOverview.busan,
            cityCovidOverview.daegu,
            cityCovidOverview.incheon,
            cityCovidOverview.gwangju,
            cityCovidOverview.daejeon,
            cityCovidOverview.ulsan,
            cityCovidOverview.sejong,
            cityCovidOverview.gyeonggi,
            cityCovidOverview.gyeongbuk,
            cityCovidOverview.chungbuk,
            cityCovidOverview.chungnam,
            cityCovidOverview.gyeongnam,
            cityCovidOverview.jeju
        ]
    }
    
    func configureChatView(covidOverviewList: [CovidOverview]) {
        
        self.pieChartView.delegate = self
        
        let entries = covidOverviewList.compactMap { [weak self] overview -> PieChartDataEntry? in
            guard let self = self else { return nil }
            return PieChartDataEntry(
                value: self.removeFormatString(string: overview.newCase),
                label: overview.countryName,
                data: overview
            )
        }
        let dataSet = PieChartDataSet(entries: entries, label: "코로나 발생 현황")
        dataSet.sliceSpace = 1
        dataSet.entryLabelColor = .black
        dataSet.valueTextColor = .black
        dataSet.xValuePosition = .outsideSlice
        dataSet.valueLinePart1OffsetPercentage = 0.8
        dataSet.valueLinePart1Length = 0.2
        dataSet.valueLinePart2Length = 0.3
        
        dataSet.colors = ChartColorTemplates.vordiplom() +
            ChartColorTemplates.joyful() +
            ChartColorTemplates.liberty() +
            ChartColorTemplates.pastel() +
            ChartColorTemplates.material()
            
        self.pieChartView.data = PieChartData(dataSet: dataSet)
        
        // 그래프 회전
        self.pieChartView.spin(duration: 0.3, fromAngle: self.pieChartView.rotationAngle, toAngle: self.pieChartView.rotationAngle + 80)
    }
    
    func removeFormatString(string: String) -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: string)?.doubleValue ?? 0
    }
    
    // 서버에서 응답받은 확진자 수에 대한 정보 totalCaseLabel, newCaseLabel에 표시되도록 만들기
    func configureStackVeiw(koreaCovidOverview: CovidOverview) {
        self.totalCaseLabel.text = "\(koreaCovidOverview.totalCase)명"
        self.newCaseLabel.text = "\(koreaCovidOverview.newCase)명"
    }
    
    // 시도별 코로나 현황 데이터를 가지고 올수 있는 api 호출하기
    // api를 요청하고 서버에서 json 데이터를 응답 받거나 실패하였을때, completionHandler 호출하면 {}안에 받거나 실패한 데이터를 전달해줌
    func fetchCovidOverview(
        completionHandler: @escaping (Result<CityCovidOverview, Error>) -> Void //  < 요청에 성공했을 때 전달할 값, 요청에 실패하거나 에러가 생겼을 때 전달할 값 >
        // @escaping : 함수의 인자로 클로저가 전돨되지만, 함수가 반환된 후에도 실행되는 것, 함수의 인자가 함수 밖에서도 사용할 수 있도록 scope를 조절해주는 것 -> 비동기 작업 시 많이 사용함
    ) { // methon 정의
        let url = "https://api.corona-19.kr/korea/country/new/"
        let param = [
            "serviceKey" : "4Cq5B9KNYdF2msP31baTgGRSJAOVrfnhu"
        ]
        
        // Alamofire를 사용하여 api 호출
        AF.request(url, method: .get, parameters: param) // method = get 방식, 요청할 쿼리 파라미터 정의(딕셔너리로 하면 자동으로 생성해줌)
        // request -> response 응답 데이터를 받을 수 있는 method 체이닝이 필요함
            .responseData(completionHandler: { response in // 응답 데이터 클로저 파라미터로 전달됨
                switch response.result {
                case let .success(data): // 요청 성공일 경우, 서버에서 데이터 전달
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(CityCovidOverview.self, from: data)
                        completionHandler(.success(result))
                    } catch { // CityCovidOverview 와 mapping에 실패하였을 때 실행
                        completionHandler(.failure(error))
                    }
                    // 요청 실패시
                case let .failure(error):
                    completionHandler(.failure(error))

                }
            })
    }
}

extension CoronaViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        guard let covidDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "CovidDetailViewController") as? CovidDetailViewController else { return }
        guard let covidOverview = entry.data as? CovidOverview else { return }
        covidDetailViewController.covidOverveiw = covidOverview
        self.navigationController?.pushViewController(covidDetailViewController, animated: true)
    }
}
