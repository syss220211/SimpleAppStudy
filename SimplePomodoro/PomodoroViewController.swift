//
//  PomodoroViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/02/10.
//

import UIKit
// 알람 소리 구현
import AudioToolbox

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
    var timerStatus: TimerStatus = .end // 타이머 상태를 갖고 있는 프로퍼티(초기값 = end)
    var timer: DispatchSourceTimer? // timer 프로퍼티 선언 - Dispatch 사용
    var currentSeconds = 0 // 현재 count down 되고 있는 시간을 초로 저장하는 프로퍼티
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggleButton()
        
    }
    
    // 타이머와 프로그래스바 hidden의 상태를 위한 함수
    func setTimerInfoViewVisble(isHidden: Bool) {
        self.timerLabel.isHidden = isHidden
        self.progreeView.isHidden = isHidden
    }
    
    // 취소 버튼 : 데이터피커, 취소 버튼 활성화, 타이머와 프로그래스 뷰가 비활성화, toggle button 시작으로 변경
    @IBAction func tapCancelButton(_ sender: UIButton) {
        switch self.timerStatus {
        case .start, .pause: // 시작된 상태나 일시정지 상태라면 타이머 종료
//            self.timerStatus = .end // 상태 : 종료
//            self.cancelButton.isEnabled = false // 취소버튼 비활성화
//            self.setTimerInfoViewVisble(isHidden: true) // 타이머 표시 라벨, 프로그래스바 비활성화
//            self.datePicker.isHidden = false // 데이터피커 표시되게 만들기
//            self.toggleButton.isSelected = false // toggle button title 시작으로 변경
            self.stopTimer()
            
        default:
            break
        }
    }
    
    // 버튼의 상태에 따른 버튼 이름 변경을 위한 함수
    func configureToggleButton() {
        self.toggleButton.setTitle("시작", for: .normal)
        self.toggleButton.setTitle("일시정시", for: .selected)
    }
    
    // 타이머 시작 및 구현 method
    func startTimer() {
        if self.timer == nil {
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main) // 타이머 인스턴스 생성
            // 타이머가 돌때마다 ui를 업데이트 해야하기 때문에 queue에 main 쓰레드 사용
            self.timer?.schedule(deadline: .now(), repeating: 1) // 어떤 주기로 타이머를 실행할 것인지 설정
            self.timer?.setEventHandler(handler: { [weak self] in // 타이머와 함께 연동되는 이벤트 핸들러 할당
                guard let self = self else { return }
                
                // 타이머 동작할 때마다 해당 handler closer 함수 호출
                self.currentSeconds -= 1 //1초에 한번씩 currentSeconds 1씩 감소
                let hour = self.currentSeconds / 3600
                let minutes = (self.currentSeconds % 3600) / 60
                let seconds = (self.currentSeconds % 3600) % 60 // 시, 분, 초 계산
                self.timerLabel.text = String(format: "%02d:%02d:%02d", hour, minutes, seconds)
                self.progreeView.progress = Float(self.currentSeconds) / Float(self.duration)
                
                if self.currentSeconds <= 0 {
                    // 타이머 종료
                    self.stopTimer()
                    AudioServicesPlaySystemSound(1005)
                }
            })
            self.timer?.resume() // 타이머 시잗
        }
    }
    
    func stopTimer() {
        if self.timerStatus == .pause{
            self.timer?.resume()
        }
        self.timerStatus = .end // 상태 : 종료
        self.cancelButton.isEnabled = false // 취소버튼 비활성화
        self.setTimerInfoViewVisble(isHidden: true) // 타이머 표시 라벨, 프로그래스바 비활성화
        self.datePicker.isHidden = false // 데이터피커 표시되게 만들기
        self.toggleButton.isSelected = false // toggle button title 시작으로 변경
        self.timer?.cancel()
        self.timer = nil // nil 할당 메모리 종료 *필수
    }
    
    @IBAction func tapToggleButton(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration) // datepicker 선택 시간 초 단위로 알려줌
        switch self.timerStatus {
        case .end:
            self.currentSeconds = self.duration
            self.timerStatus = .start
            self.setTimerInfoViewVisble(isHidden: false) // 타이머 라벨, 프로그래스바 표시되도록 만들기
            self.datePicker.isHidden = true // datepicker 사라지게 만들기
            self.toggleButton.isSelected = true // 버튼의 title 일시정지
            self.cancelButton.isEnabled = true // 취소 버튼 활성화
            self.startTimer() // 타이머 기능
            
        case .start:
            self.timerStatus = .pause // 시작 버튼 누르면 시작 상태 -> 일시정지 상태
            self.toggleButton.isSelected = false // toggle button title이 시작이 되도록 만들기
            self.timer?.suspend() // 일시정시 기능
            
        case .pause:
            self.timerStatus = .start // 일시정지 버튼 누르면 일시정지 상태 -> 시작 상태
            self.toggleButton.isSelected = true // toggle button title이 일시정지가 되도록 만들기
            self.timer?.resume() // 타이머 시작
        }
    }
}
