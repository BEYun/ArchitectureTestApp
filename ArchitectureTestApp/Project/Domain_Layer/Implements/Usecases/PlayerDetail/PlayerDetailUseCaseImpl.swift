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
    var editPlayer: EditPlayerUseCase
    
    init(getPlayerUseCase: GetPlayerUseCase, addCommentUseCase: AddCommentUseCase, editPlayer: EditPlayerUseCase) {
        self.getPlayerUseCase = getPlayerUseCase
        self.addCommentUseCase = addCommentUseCase
        self.editPlayer = editPlayer
    }
}
