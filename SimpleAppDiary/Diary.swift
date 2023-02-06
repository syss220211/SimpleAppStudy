//
//  Diary.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/01/25.
//

import Foundation


struct Diary {
    // uuid 추가
    var uuidString: String
    var title: String // 제목
    var contents: String // 내용
    var date: Date // 날짜
    var isStar: Bool // 즐겨찾기 여부
}
