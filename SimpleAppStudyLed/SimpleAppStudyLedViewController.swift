//
//  SimpleAppStudyLedViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/01/05.
//

import UIKit

class SimpleAppStudyLedViewController: UIViewController, LEDBoardSettingDelegate {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        // 이전화면에서 전달하는 설정 값들을 뷰로 초기화
        if let text = text {
            self.contentsLabel.text = text
        }
        self.contentsLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }
    

    @IBOutlet weak var contentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // segue로 구현했기 때문에 prepare 구현
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController {
            settingViewController.delegate = self
            settingViewController.ledText = self.contentsLabel.text
            settingViewController.textColor = self.contentsLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
        }
    }
}
