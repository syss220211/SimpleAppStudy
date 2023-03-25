//
//  SpotifyViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/03/24.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Navigation Bar 숨기기
        navigationController?.navigationBar.isHidden = true
    }

}
