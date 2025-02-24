//
//  DIContainer.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/23/25.
//

import Foundation

class DIContainer {
    func makePlayerListPresenter(isAdmin: Bool) -> PlayerListPresenter {
        let repository: PlayerRepositoryImpl = .init()
        let mapper: PlayerMapper = .init()
        let usecase: GetPlayerListUseCaseImpl = .init(repository: repository, mapper: mapper)
        let presenter: PlayerListPresenter = .init(isAdmin: isAdmin, getPlayerListUseCase: usecase)
        
        return presenter
    }
}
