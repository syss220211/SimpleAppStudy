//
//  EnterEmailViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/04/05.
//

import UIKit

class EnterEmailViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 20
        
        nextButton.isEnabled = false
        
        //textfield 값 받아오기 위한 delegate
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        // 커서 자동 위치
        emailTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Navigaion Bar 보이기
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
    }
}

extension EnterEmailViewController:
    UITextFieldDelegate {
    
    // 키보드 내려가게 하는 메소드
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    // 필드의 값 유무에 따른 다음 버튼 활성화 설정
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextField.text == ""
        nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
    
    
}
