//
//  Request + Comment.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/24/25.
//

import Foundation

public struct AddCommentRequestDTO: Encodable {
    let id: Int
    let comment: String
    // MARK: Presentation Layer의 Input과 Repository Layer의 DTO를 분리하여 사용하는 이유(경계 횡단)
    // API에서 요구하는 사항 != Presentation Layer 데이터인 경우, Presentation Layer가 알 필요가 없음
    // 예) 어드민에서 데이터 축적용으로 쓸 타입 하나 주세요
    // -> 기존: viewModel에서 RequestModel에 타입을 넣어서 보냄
    // -> 변경: UI에서의 Input은 변함이 없음, API 호출에 사용되는 타입인 DTO만 수정(명확한 책임 분리)
    
//    let commentType: SomeCommentType
}
