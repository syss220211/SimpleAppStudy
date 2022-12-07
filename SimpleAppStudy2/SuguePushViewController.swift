//
//  SuguePushViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2022/11/30.
//

import UIKit

class SuguePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 이전 화면으로 돌아가는 button 
    @IBAction func tabBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
