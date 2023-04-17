//
//  ECodeViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/04/17.
//

import UIKit

class ECodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }

}
