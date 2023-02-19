//
//  PomodoroViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/02/10.
//

import UIKit

// 프로그래스 바 상태 enum
enum TimerStatus {
    case start
    case pause
    case end
}

class PomodoroViewController: UIViewController {

    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var progreeView: UIProgressView!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var toggleButton: UIButton!
    
    // 타이머 시간 초로 저장하는 프로퍼티
    var duration = 60
    var timerStatus: TimerStatus = .end // 타이머 상태를 갖고 있는 프로퍼티
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggleButton()
        
    }
    
    //
    func setTimerInfoViewVisble(isHidden: Bool) {
        self.timerLabel.isHidden = isHidden
        self.progreeView.isHidden = isHidden
    }
    
    @IBAction func tapCancelButton(_ sender: UIButton) {
        
    }
    
    func configureToggleButton() {
        self.toggleButton.setTitle("시작", for: .normal)
        self.toggleButton.setTitle("일시정시", for: .selected)
    }
    
    @IBAction func tapToggleButton(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration) // datepicker 선택 시간 초 단위로 알려줌
        switch self.timerStatus {
        case .end:
            self.timerStatus = .start
            self.setTimerInfoViewVisble(isHidden: false) // 타이머 라벨, 프로그래스바 표시되도록 만들기
            self.datePicker.isHidden = true // datepicker 사라지게 만들기
            self.toggleButton.isSelected = true
            self.cancelButton.isEnabled = true
            
        case .start:
            self.timerStatus = .pause
    
        default:
            break
            
        }
    }
}
