//
//  PlayerMapperInterface.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/22/25.
//

import Foundation

protocol PlayerMapperInterface {
    static var shared: PlayerMapperInterface { get }
    
    // MARK: From DTO To Entity
    func mapping(dto: GetPlayerResponseDTO) -> Player
    func mapping(dto: GetPlayerListResponseDTO) -> [Player]
    
    // MARK: From Entity To Presentation Layer Output
    func mapping(entity: Player) -> GetPlayerOutput
    func mapping(entity: [Player]) -> GetPlayerListOutput
}
