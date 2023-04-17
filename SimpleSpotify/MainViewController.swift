//
//  MainViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/04/18.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // 뒤로가기 막기
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
