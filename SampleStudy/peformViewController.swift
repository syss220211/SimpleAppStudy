//
//  peformViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/04/17.
//

import UIKit

class peformViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func performBackButton(_ sender: UIButton) {
//        performSegue(withIdentifier: "BackButton", sender: sender)
//        navigationController?.popViewController(animated: true)
        self.presentingViewController?.dismiss(animated: true) // segue presentation을 modaliy로 설정하면 사용가능함
    }

}
