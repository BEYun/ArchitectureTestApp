//
//  Response + PlayerList.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/22/25.
//

import Foundation

public struct GetPlayerListResponseDTO: Decodable {
    public struct PlayerDTO: Decodable {
        let id: Int
        let name: String
        let age: Int
        let height: Double
        let weight: Double
        let likeCount: Int
    }
    
    let playerList: [PlayerDTO]
}
