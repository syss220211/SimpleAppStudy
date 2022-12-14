//
//  SeguePushViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2022/12/14.
//

import UIKit

class SeguePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    @IBAction func segueBackButton(_ sender: UIButton) {
        let test = self.navigationController?.popViewController(animated: true)
    }
    
}
