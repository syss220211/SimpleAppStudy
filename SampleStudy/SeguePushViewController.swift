//
//  SeguePushViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2022/12/14.
//

import UIKit

class SeguePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func segueBackButton(_ sender: UIButton) {
        let test = self.navigationController?.popViewController(animated: true)
    }
    // 생애주기 확인
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear, ViewController 뷰가 나타날 것이다.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear, ViewController 뷰가 나타날 것이다.")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear, ViewController 뷰가 사라질 것이다.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear, ViewController 뷰가 사라졌다.")
    }
}
