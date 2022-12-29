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
    
    @IBAction func pushButton(_ sender: UIButton) {
        guard let viewTest = self.storyboard?.instantiateViewController(withIdentifier: "CodePushTestViewController") else { return }
        self.navigationController?.pushViewController(viewTest, animated: true)
                
    }
    
}
