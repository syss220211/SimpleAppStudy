//
//  SampleStudyViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2022/12/12.
//

import UIKit

class SampleStudyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // code push
    
    @IBAction func codePushButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
