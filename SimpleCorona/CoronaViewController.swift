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
                debugPrint("success \(result)")
            case let .failure(error):
                debugPrint("error \(error)")
            }
        }

    }
    
    func fetchCovidOverview(
        completionHandler: @escaping (Result<CityCovidOverview, Error>) -> Void
    ) {
        let url = "http://api.cornoa-19.kr/korea/county/new"
        let param = [
            "serviceKey" : "4Cq5B9KNYdF2msP31baTgGRSJAOVrfnhu"
        ]
        
        AF.request(url, method: .get, parameters: param) // api 호출
            .responseData(completionHandler: { response in
                switch response.result {
                case let .success(data):
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(CityCovidOverview.self, from: data)
                        completionHandler(.success(result))
                    } catch {
                        completionHandler(.failure(error))
                    }
                    // 요청 실패시
                case let .failure(error):
                    completionHandler(.failure(error))

                }
            })
    }
    

}
