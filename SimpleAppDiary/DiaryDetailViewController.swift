//
//  DiaryDetailViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/01/20.
//

import UIKit

// 일기 삭제 기능 구현
protocol DiaryDetailViewDelegate: AnyObject {
    func didSelectDelete(indexPath: IndexPath)
    
    // 즐겨찾기 delegate
    func didSelectStart(indexPath: IndexPath, isStar: Bool)
}

class DiaryDetailViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentsTextView: UITextView!
    @IBOutlet var dateLabel: UILabel!
    // 즐겨찾기
    var starButton: UIBarButtonItem?
    
    weak var delegate: DiaryDetailViewDelegate?
    
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
        self.starButton = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(tapStarButton))
        self.starButton?.image = diary.isStar ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        self.starButton?.tintColor = .systemPink
        self.navigationItem.rightBarButtonItem = self.starButton
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    
    @objc func editDiaryNotification(_ notification: Notification) {
        guard let diary = notification.object as? Diary else { return }
        guard let row = notification.userInfo?["indexPath.row"] as? Int else { return }
        self.diary = diary
        self.configureView()
    }
    
    @IBAction func tapEditButton(_ sender: UIButton) {
        // 수정 기능 구현
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "WriteDiaryViewController") as? WriteDiaryViewController else { return }
        guard let indexPath = self.indexPath else { return }
        guard let diary = self.diary else { return }
        viewController.diaryEditorMode = .edit(indexPath, diary)
        self.navigationController?.pushViewController(viewController, animated: true)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(editDiaryNotification(_:)),
            name: NSNotification.Name("editDiary"),
            object: nil)
    }
    
    @IBAction func tapDeleteButton(_ sender: UIButton) {
        guard let indexPath = self.indexPath else { return }
        self.delegate?.didSelectDelete(indexPath: indexPath)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func tapStarButton() {
        // 즐겨찾기 토글
        guard let isStar = self.diary?.isStar else { return }
        guard let indexPath = self.indexPath else { return }
        if isStar {
            self.starButton?.image = UIImage(systemName: "star")
        } else {
            self.starButton?.image = UIImage(systemName: "star.fill")
        }
        self.diary?.isStar = !isStar
//        self.delegate?.didSelectStart(indexPath: indexPath, isStar: self.diary?.isStar ?? false)
        NotificationCenter.default.post(
            name: NSNotification.Name("starDiary"),
            object: [
                "isStar": self.diary?.isStar ?? false,
                "indexPath" : indexPath
            ],
        userInfo: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
