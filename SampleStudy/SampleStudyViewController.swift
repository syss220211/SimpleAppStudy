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
    
    @IBAction func CodeButton(_ sender: UIButton) {
        guard let codeButton = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") else { return }
        
        self.navigationController?.pushViewController(codeButton, animated: true)
    }
    
    
    
}
