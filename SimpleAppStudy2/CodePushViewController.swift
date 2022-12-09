//
//  CodePushViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2022/12/08.
//

import UIKit

class CodePushViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func codePushButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
}
