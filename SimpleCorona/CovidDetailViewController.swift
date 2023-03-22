//
//  CovidDetailViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/03/06.
//

import UIKit

class CovidDetailViewController: UITableViewController {

    @IBOutlet var newCaseCell: UITableViewCell!
    @IBOutlet var totalCaseCell: UITableViewCell!
    @IBOutlet var recoveredCell: UITableViewCell!
    @IBOutlet var deathCell: UITableViewCell!
    @IBOutlet var percentCell: UITableViewCell!
    @IBOutlet var overseasInflowCell: UITableViewCell!
    @IBOutlet var regionalOutbreakCell: UITableViewCell!
    
    
    // 선택된 지역의 코로나 발생 데이터 전달받을 프로퍼티
    var covidOverveiw: CovidOverview?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    func configureView() {
        guard let covidOverveiw = self.covidOverveiw else { return }
        self.title = covidOverveiw.countryName
        self.newCaseCell.detailTextLabel?.text = "\(covidOverveiw.newCase)명"
        self.totalCaseCell.detailTextLabel?.text = "\(covidOverveiw.totalCase)명"
        self.recoveredCell.detailTextLabel?.text = "\(covidOverveiw.recovered)명"
        self.deathCell.detailTextLabel?.text = "\(covidOverveiw.death)명"
        self.percentCell.detailTextLabel?.text = "\(covidOverveiw.percentage)%"
        self.overseasInflowCell.detailTextLabel?.text = "\(covidOverveiw.newFcase)명"
        self.regionalOutbreakCell.detailTextLabel?.text = "\(covidOverveiw.newCcase)명"
    }
}
