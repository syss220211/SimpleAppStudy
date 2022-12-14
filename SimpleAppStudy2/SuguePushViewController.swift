//
//  SuguePushViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2022/11/30.
//

import UIKit

class SuguePushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 전달받은 데이터 namelabel에 표시하기
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.adjustsFontSizeToFitWidth = true
//            self.nameLabel.sizeToFit()
        }
    }
    
    // 이전 화면으로 돌아가는 button 
    @IBAction func tabBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
