//
//  EnterEmailViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/04/05.
//

import UIKit

class EnterEmailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Navigaion Bar 보이기
        navigationController?.navigationBar.isHidden = false
    }

}
