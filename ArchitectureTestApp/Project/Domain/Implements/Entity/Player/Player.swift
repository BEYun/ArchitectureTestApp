//
//  Player.swift
//  ArchitectureTestApp
//
//  Created by Yun on 2/19/25.
//

import Foundation

/// 선수 Entity Class
/// - Parameters:
///    - id: 기본키
///    - physicalInfo: 신체정보
///    - personalInfo: 개인정보(관리자만 확인 가능, Actor Check)
///    - backNumber: 등번호(Nullable Check)
///    - likeCount: 좋아요 개수(Usecase Call)
///    - comment: 댓글(Usecase with Parameter)
class Player {
    let id: Int
    var physicalInfo: PhysicalInfo
    var personalInfo: PersonalInfo
    let backNumber: String?
    let likeCount: Int
    let comment: [String]
    
    init(id: Int,
         physicalInfo: PhysicalInfo,
         personalInfo: PersonalInfo = .init(salary: nil),
         backNumber: String? = nil,
         likeCount: Int = 0,
         comment: [String] = []
    ) {
        self.id = id
        self.physicalInfo = physicalInfo
        self.personalInfo = personalInfo
        self.backNumber = backNumber
        self.likeCount = likeCount
        self.comment = comment
    }
}
