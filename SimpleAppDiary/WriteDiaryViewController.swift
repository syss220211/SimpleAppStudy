//
//  WriteDiaryViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/01/19.
//

import UIKit

class WriteDiaryViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentsTextView: UITextView!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var confirmButton: UIBarButtonItem!
    
    private let datePicker = UIDatePicker()
    private var diaryDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
        self.confrigureDatePicker()
        self.confirmButton.isEnabled = false
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
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        self.datePicker.locale = Locale(identifier: "ko_KR")
        self.dateTextField.inputView = self.datePicker
    }
    
    private func configureInputField() {
        self.contentsTextView.delegate = self
    }
    
    @IBAction func tapConfirmButton(_ sender: UIBarButtonItem) {
    }
    
    @objc private func datePickerValueDidChange(_ datePciker: UIDatePicker) {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy년 MM월 dd일(EEEEE)"
        formater.locale = Locale(identifier: "ko_KR")
        self.diaryDate = datePicker.date
        self.dateTextField.text = formater.string(from: datePicker.date)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func validateInputField() {
        self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.dateTextField.text?.isEmpty ?? true) && !self.contentsTextView.text.isEmpty
    }
}

extension WriteDiaryViewController: UITextViewDelegate {
    func textViewDidChange(_ textView : UITextView) {
        self.validateInputField()
    }
}
