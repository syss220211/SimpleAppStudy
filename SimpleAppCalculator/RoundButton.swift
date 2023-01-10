//
//  RoundButton.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/01/10.
//

import UIKit

// UIButton Custom

@IBDesignable
class RoundButton: UIButton {
    // 연산 프로퍼티 선언
    @IBInspectable var isRound: Bool = false { // 스토리보드에서도 프로퍼티를 사용할 수 있도록 @
        didSet {
            if isRound { // isRound = Ture
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
