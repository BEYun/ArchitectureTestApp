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
///    - name: 이름
///    - physicalInfo: 신체정보
///    - privateInfo: 개인정보(관리자만 확인 가능, Actor Check)
///    - backNumber: 등번호(Nullable Check)
///    - likeCount: 좋아요 개수(Usecase Call)
///    - comment: 댓글(Usecase with Parameter)
class Player {
    let id: Int
    let name: String
    var physicalInfo: PhysicalInfo
    var privateInfo: PrivateInfo
    let backNumber: String?
    let likeCount: Int
    let comment: [String]
    
    init(id: Int,
         name: String,
         physicalInfo: PhysicalInfo,
         privateInfo: PrivateInfo = .init(salary: nil),
         backNumber: String? = nil,
         likeCount: Int = 0,
         comment: [String] = []
    ) {
        self.id = id
        self.name = name
        self.physicalInfo = physicalInfo
        self.privateInfo = privateInfo
        self.backNumber = backNumber
        self.likeCount = likeCount
        self.comment = comment
    }
    
    // Entity의 비즈니스 정책(Validator 클래스 사용하여 책임 분리 가능)
    // 예시)
    // 1) 나이는 18세 이상
    // 2) 키는 100cm 이상
    // 3) 몸무게는 30kg 이상
    func validate() -> Bool {
        let age = physicalInfo.age
        let height = physicalInfo.height
        let weight = physicalInfo.weight
        
        let isValidAge: Bool = age >= 18
        let isValidHeight: Bool = height >= 100
        let isValidWeight: Bool = weight >= 30
        
        return isValidAge && isValidHeight && isValidWeight
    }
}
