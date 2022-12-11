//
//  Study2ViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2022/11/25.
//

import UIKit

class Study2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func tapCodePresent(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController") else { return }
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
        
    }
    
    @IBAction func tapCodePushButton(_ sender: UIButton) {
        
        //optional -> guard
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController" ) else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
        
        
    }
}
