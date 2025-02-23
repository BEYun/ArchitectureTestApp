//
//  GetPlayerListOutput.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/22/25.
//

import Foundation

public struct GetPlayerListOutput {
    // Presentation Layer에서 사용할 수 있는 Value Object
    public struct PlayerOutput {
        let id: Int
        let name: String
        let likeCount: Int
    }
    
    let playerList: [PlayerOutput]
}
