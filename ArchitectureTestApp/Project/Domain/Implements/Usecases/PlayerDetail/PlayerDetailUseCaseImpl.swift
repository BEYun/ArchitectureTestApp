//
//  PlayerDetailUseCase.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/24/25.
//

import Foundation

class PlayerDetailUseCaseImpl: PlayerDetailUseCase {
    var getPlayerUseCase: GetPlayerUseCase
    var addCommentUseCase: AddCommentUseCase
    
    init(getPlayerUseCase: GetPlayerUseCase, addCommentUseCase: AddCommentUseCase) {
        self.getPlayerUseCase = getPlayerUseCase
        self.addCommentUseCase = addCommentUseCase
    }
}
