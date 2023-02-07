//
//  WriteDiaryViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/01/19.
//

import UIKit

enum DiaryEditorMode {
    case new
    case edit(IndexPath, Diary)
}

// delegate 정의
// 일기장 리스트 화면에 일기가 작성된 diary 객체를 전달하기 위함
protocol WriteDiaryViewDelegate: AnyObject {
    func didSelectReigster(diary: Diary)
}

class WriteDiaryViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentsTextView: UITextView!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var confirmButton: UIBarButtonItem!
    
    // 프로퍼티 선언 - dataPicker에서 저장되는 date를 위한 프로퍼티
    private let datePicker = UIDatePicker()
    private var diaryDate: Date?
    weak var delegate: WriteDiaryViewDelegate?
    var diaryEditorMode: DiaryEditorMode = .new
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
        self.confrigureDatePicker()
        self.configureInputField()
        self.configureEditMode()
        // 아무 내용도 없을 때 등록 버튼 비활성화로 설정
        self.confirmButton.isEnabled = false
    }
    
    private func configureEditMode() {
        switch self.diaryEditorMode {
        case let .edit(_, diary):
            self.titleTextField.text = diary.title
            self.contentsTextView.text = diary.contents
            self.dateTextField.text = self.dateToString(date: diary.date)
            self.diaryDate = diary.date
            self.confirmButton.title = "수정"
            
        default:
            break
        }
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }

    // 내용 textView에 바깥 라인 추가
    private func configureContentsTextView() {
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        self.contentsTextView.layer.borderColor = borderColor.cgColor
        self.contentsTextView.layer.borderWidth = 0.5
        self.contentsTextView.layer.cornerRadius = 5.0
    }
    
    // 날짜 datepicker 나오게 만들기
    private func confrigureDatePicker() {
        self.datePicker.datePickerMode = .date // 날짜만 나오게 설정
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        // addTarget mehtod : UIController 객체가 이벤트가 응답하는 방식 설정
        // (타켓, 이벤트 발생시 응답으로 호출되는 메소드 정의, 액션에 정의한 변수 - 값이 변경될때마다 메소드 호출을 위해서 valueChanged 설정)
        self.datePicker.locale = Locale(identifier: "ko_KR")
        self.dateTextField.inputView = self.datePicker
    }
    
    private func configureInputField() {
        self.contentsTextView.delegate = self
        self.titleTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_ :)), for: .editingChanged)
        self.dateTextField.addTarget(self, action: #selector(dateTextFieldDidChange(_ :)), for: .editingChanged)
        
    }
    
    @IBAction func tapConfirmButton(_ sender: UIBarButtonItem) {
        guard let title = self.titleTextField.text else { return }
        guard let contents = self.contentsTextView.text else { return }
        guard let date = self.diaryDate else { return }
//        self.delegate?.didSelectReigster(diary: diary)
        
        switch self.diaryEditorMode {
        case .new:
            let diary = Diary(
                uuidString: UUID().uuidString,
                title: title,
                contents: contents,
                date: date,
                isStar: false
             )
            self.delegate?.didSelectReigster(diary: diary)
        
        case let .edit(indexPath, diary):
            let diary = Diary(
                uuidString: diary.uuidString,
                title: title,
                contents: contents,
                date: date,
                isStar: diary.isStar
            )
            NotificationCenter.default.post(
                name: NSNotification.Name("editDiary"),
                object: diary,
                userInfo: nil
                )
        }
        self.navigationController?.popViewController(animated: true) // 전화면으로 이동 되도록
    }
    
    // 제목 textfield에 text가 입력될 때마다 호출되는 method
    @objc private func titleTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField() // 제목이 입력될 때마다 등록 버튼 활성화 여부 판단하기
    }
    
    // datePicker 호출되는 메소드 정의
    @objc private func datePickerValueDidChange(_ datePciker: UIDatePicker) {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy년 MM월 dd일(EEEEE)"
        formater.locale = Locale(identifier: "ko_KR")
        self.diaryDate = datePicker.date
        self.dateTextField.text = formater.string(from: datePicker.date)
        
        // 날짜 값이 text 값이 아니라서 chaeng에 걸리지 않아서 따로 추가
        self.dateTextField.sendActions(for: .editingChanged)
    }
    
    // 날짜가 등록될때마다 등록 버튼 활성화 유무 판단
    @objc private func dateTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField()
    }
    
    // 다른 화면 눌렀을 때 키보드 들어가도록 만들기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // 등록 버튼 활성화 여부 판단 method
    private func validateInputField() {
        self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.dateTextField.text?.isEmpty ?? true) && !self.contentsTextView.text.isEmpty
    }
}

extension WriteDiaryViewController: UITextViewDelegate {
    // textView의 text가 입력될 때마다 호출되는 method = 일기장 내용 입력시마다 호출됨
    func textViewDidChange(_ textView : UITextView) {
        self.validateInputField() // text가 입력 될 때마다 내용이 있는지 없는지 확인하여 등록 버튼 활성화 유무 파악하기
    }
}
