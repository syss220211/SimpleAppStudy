//
//  presentSegueViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2022/12/14.
//

import UIKit

class presentSegueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func presentBackButton(_ sender: UIButton) {
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
