//
//  PlayerDetailUseCase.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/24/25.
//

import Foundation

// MARK: UseCase 조합하기
// 예시) 선수 정보 기능
// 1) 선수 정보 조회
// 2) 댓글 추가
public protocol PlayerDetailUseCase {
    var getPlayerUseCase: GetPlayerUseCase { get }
    var addCommentUseCase: AddCommentUseCase { get }
    var editPlayer: EditPlayerUseCase { get }
}
