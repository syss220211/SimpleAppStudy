//
//  ViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2022/11/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var sentence: UILabel!
     
    let content = [ // 내용 변수 선언
        // struct 사용
        Content(sentence: "삶이 있는 한 희망은 있다", name: "키케로"),
        Content(sentence: "너무 소심하고 까다롭게 자신의 행동을 고민하지 말라 . 모든 인생은 실험이다 . 더많이 실험할수록 더나아진다", name: "랄프 왈도 에머슨"),
        Content(sentence: "한번의 실패와 영원한 실패를 혼동하지 마라", name: "F.스콧 핏제랄드"),
        Content(sentence: "내일은 내일의 태양이 뜬다", name: "unknown"),
        Content(sentence: "피할수 없으면 즐겨라", name: "로버트 엘리엇"),
        Content(sentence: "절대 어제를 후회하지 마라. 인생은 오늘의 내 안에 있고 내일은 스스로 만드는것이다.", name: "L론허바드"),
        Content(sentence: "계단을 밟아야 계단 위에 올라설수 있다", name: "터키속담")
    ]
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // view 둥글게 만들기
        contentView.layer.cornerRadius = 10
    }
    
    
    @IBAction func changeButton(_ sender: Any) {
        
        // 누를때마다 명언 바꾸는 button
        self.contentView.backgroundColor = .black
        sentence.textColor = .white
        name.textColor = .white
        
        // 랜덤으로 인덱스 조절
        let index = Int(arc4random_uniform(6))
        let viewContent = content[index]
        
        
        self.sentence.text = viewContent.sentence
        self.name.text = viewContent.name
    }
    
}

