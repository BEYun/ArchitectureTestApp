//
//  GetPlayerUseCaseImpl.swift
//  ArchitectureTestApp
//
//  Created by Yun on 2/21/25.
//

import Foundation

class GetPlayerUseCaseImpl: GetPlayerUseCase {
    let repository: PlayerRepository
    
    init(repository: PlayerRepository) {
        self.repository = repository
    }
    
    func execute(with: GetPlayerInput) -> Output<GetPlayerOutput, String> {
        do {
            let result: ResponseDTO = try repository.getPlayer()
            // 1) Entity Validate
//            let player: Player = result.toPlayer()
            // 2) Usecase Validate
//            let output: GetPlayerOutputModel = player.toGetPlayerOutput()
            
            return .onSuccess(with: GetPlayerOutput())
        } catch(let error) {
            return .onFailure(with: )
        }
        
    }
}

public struct GetPlayerInput {
    
}

public struct GetPlayerOutput {
    
}
