//
//  SpotifyViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/03/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [emailLoginButton, googleLoginButton, appleLoginButton].forEach{
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        // Navigation Bar 숨기기
//        navigationController?.navigationBar.isHidden = true
//    } //-> ?? 똑같음, 무슨 차이인지 잘 모르겠음
    
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        // Firebase 인증
    }
    

    @IBAction func appleLoginButtonTapped(_ sender: UIButton) {
        // Firebase 인증
    }
}
