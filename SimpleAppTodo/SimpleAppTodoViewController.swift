//
//  SimpleAppTodoViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/01/11.
//

import UIKit

class SimpleAppTodoViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
        
    }
    
    // add button -> 할일을 등록할 수 있도록 alert present
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        
        // alert 표시
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default) { _ in
            // 등록을 눌렀을 때 클로저 실행 -> textfield 값 가져오게 만들기
            
        }
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        // 파라미터에 정의한 uialert 넣어주기
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        
        // 할일 등록을 위한 textfield 추가
        // configurationHandler : alert 표시 전 textfield를 구성하기 위한 클로저
        alert.addTextField { textField in
            textField.placeholder = "할 일을 입력해주세요."
        }
        
        // add 버튼 눌렀을 때 alert 표시
        self.present(alert, animated: true, completion: nil)
    }
}
