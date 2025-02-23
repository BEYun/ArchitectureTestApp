//
//  PlayerListPresenter.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/22/25.
//

import Foundation

class PlayerListPresenter: ObservableObject {
    typealias Player = GetPlayerListOutput.PlayerOutput
    
    // @Environment(\.isAdmin) var isAdmin
    let isAdmin: Bool
    
    // UI State, SceneModel에 데이터 바인딩 추가해야 함
    @Published var playerList: [Player] = []
    
    let getPlayerListUseCase: GetPlayerListUseCase
    
    init(isAdmin: Bool, getPlayerListUseCase: GetPlayerListUseCase) {
        self.isAdmin = isAdmin
        self.getPlayerListUseCase = getPlayerListUseCase
    }
    
    @MainActor
    func fetchPlayerList() async {
        let output = await getPlayerListUseCase.execute()
        
        switch output {
        case .onSuccess(let output):
            self.playerList = output.playerList
            
        case .onFailure(let error):
            // MARK: Error Handling
            print(error)
        }
    }
}
