//
//  PlayerMapper.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/22/25.
//

import Foundation

class PlayerMapper: PlayerMapperInterface {
    func mapping(dto: GetPlayerResponseDTO) -> Player {
        let id: Int = dto.id
        let name: String = dto.name
        let age: Int = dto.age
        let height: Double = dto.height
        let weight: Double = dto.weight
        let salary: Int? = dto.salary
        let likeCount: Int = dto.likeCount
        let comment: [String] = dto.comment
        
        let physicalInfo: PhysicalInfo = .init(age: age, height: height, weight: weight)
        let privateInfo: PrivateInfo = .init(salary: salary)
        
        let player: Player = .init(
            id: id,
            name: name,
            physicalInfo: physicalInfo,
            privateInfo: privateInfo,
            likeCount: likeCount,
            comment: comment
        )
        
        return player
    }
    
    func mapping(dto: GetPlayerListResponseDTO) -> [Player] {
        let playerList = dto.playerList.map { data in
            let id: Int = data.id
            let name: String = data.name
            let age: Int = data.age
            let height: Double = data.height
            let weight: Double = data.weight
            let likeCount: Int = data.likeCount
            
            let physicalInfo: PhysicalInfo = .init(age: age, height: height, weight: weight)
            
            let player: Player = .init(id: id, name: name, physicalInfo: physicalInfo, likeCount: likeCount)
            
            return player
        }
        
        return playerList
    }
    
    func mapping(entity: Player) -> GetPlayerOutput {
        let id: Int = entity.id
        let name: String = entity.name
        let age: Int = entity.physicalInfo.age
        let height: Double = entity.physicalInfo.height
        let weight: Double = entity.physicalInfo.weight
        let salary: Int? = entity.privateInfo.salary
        let likeCount: Int = entity.likeCount
        let comment: [String] = entity.comment
        
        let output: GetPlayerOutput = .init(
            id: id,
            name: name,
            age: age,
            height: height,
            weight: weight,
            salary: salary,
            likeCount: likeCount,
            comment: comment
        )
        
        return output
    }
    
    func mapping(entity: [Player]) -> GetPlayerListOutput {
        typealias PlayerOutput = GetPlayerListOutput.PlayerOutput
        
        let playerList = entity.map { player in
            let id: Int = player.id
            let name: String = player.name
            let likeCount: Int = player.likeCount
            
            let playerOutput: PlayerOutput = .init(id: id, name: name, likeCount: likeCount)
            
            return playerOutput
        }
        
        let output: GetPlayerListOutput = .init(playerList: playerList)
        
        return output
    }
}
