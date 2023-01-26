//
//  DiaryDetailViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/01/20.
//

import UIKit

class DiaryDetailViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentsTextView: UITextView!
    @IBOutlet var dateLabel: UILabel!
    
    // 일기장 리스트에서 전달 받을 프로퍼티 선언
    var diary: Diary?
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    // 전달받은 diary 객체 View에 초기화
    private func configureView() {
        guard let diary = self.diary else { return }
        self.titleLabel.text = diary.title
        self.contentsTextView.text = diary.contents
        self.dateLabel.text = self.dateToString(date: diary.date)
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    
    
    @IBAction func tapEditButton(_ sender: UIButton) {
        
    }
    
    @IBAction func tapDeleteButton(_ sender: UIButton) {
        
    }
    
}
