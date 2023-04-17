//
//  DCodeViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/04/16.
//

import UIKit

class DCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func DBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
