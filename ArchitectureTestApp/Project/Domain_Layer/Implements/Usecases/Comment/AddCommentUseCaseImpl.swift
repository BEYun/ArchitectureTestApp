//
//  AddCommentUseCaseImpl.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/24/25.
//

import Foundation

class AddCommentUseCaseImpl: AddCommentUseCase {
    let repository: PlayerRepository
    
    init(repository: PlayerRepository) {
        self.repository = repository
    }
    
    func execute(input: AddCommentInput) async -> Output<Void, Error> {
        let id = input.id
        let comment = input.comment
        
        // 비즈니스 로직
        if comment.count > 150 {
            return .onFailure(error: DomainError.addCommentFailure)
        }
        
        let requestDTO: AddCommentRequestDTO = .init(id: id, comment: comment)
        
        let response: Bool = await repository.addComment(requestDTO: requestDTO)
        
        if response {
            return .onSuccess(output: ())
            
        } else {
            return .onFailure(error: DomainError.addCommentFailure)
        }
    }
}
