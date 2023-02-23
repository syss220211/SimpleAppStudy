//
//  RoundButton.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/01/10.
//

import UIKit

// UIButton Custom
// UIButton 을 상속 받음 = 기존 버튼 속성 + 커스텀 속성이 사용 가능한 클래스

@IBDesignable // 변경된 속성 실시간으로 스토리 보드에서 확인가능 (
class RoundButton: UIButton {
    // 연산 프로퍼티 선언
    @IBInspectable var isRound: Bool = false { // 스토리보드에서도 프로퍼티를 사용할 수 있도록 @
        didSet {
            if isRound { // isRound = Ture
                self.layer.cornerRadius = self.frame.height / 2 // 둥글게  
            }
        }
    }
}
