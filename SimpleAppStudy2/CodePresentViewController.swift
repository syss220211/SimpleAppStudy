//
//  codePresentViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2022/12/12.
//

import UIKit

// 뷰컨으로 전달할 데이터 정의
protocol SendDataDelgate: AnyObject {
    // name이라는 파라미터를 넘길 수 있도록 sendData 함수 정의
    func sendData(name: String)
    
}
class CodePresentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    // nameLabel out에 해당하는 프로퍼티 추가
    var name: String?
    weak var delgate: SendDataDelgate? // -> delgate 변수는 위임 준비 완료
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 전달 받은 name 프로퍼티 name label에 표시하기
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }

    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        // 이전 화면으로 돌아가기전에 데이터 전달
        self.delgate?.sendData(name: "codepresent에서 viewcon으로 전달할 데이터")
        // -> 데이터를 전달받은 뷰컨에서 sendDataDelgate 프로토콜을 채택하고
        // delgate를 위임받으면 프로토콜을 채택한 이전 뷰컨에서 sendData 함수가 실행됨.
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
