//
//  CodePushViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2022/12/12.
//

import UIKit

class CodePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}