//
//  CodePushViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2022/12/12.
//

import UIKit

class CodePushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    // nameLabel out에 해당하는 프로퍼티 추가
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 전달 받은 name 프로퍼티 name label에 표시하기
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }

    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
