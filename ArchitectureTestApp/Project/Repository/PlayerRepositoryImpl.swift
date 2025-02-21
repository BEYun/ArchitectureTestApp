//
//  PlayerRepositoryImpl.swift
//  ArchitectureTestApp
//
//  Created by Yun on 2/21/25.
//

import Foundation

class PlayerRepositoryImpl: PlayerRepository {
    func getPlayer(id: Int) throws -> ResponseDTO {
        // API Call Logic
        let playerData: [String: Any] = PlayerData.shared.getPlayer(id: id)
        let data: Data = try JSONSerialization.data(withJSONObject: playerData, options: [])
        
        // Mapping DTO
        let response: ResponseDTO = .init(response: data, status: 0)
    }
    
    func addPlayer() throws -> ResponseDTO {
        <#code#>
    }
    
    func editPlayer() throws -> ResponseDTO {
        <#code#>
    }
    
    func deletePlayer() throws -> ResponseDTO {
        <#code#>
    }
    
}




private class PlayerData {
    static var shared: PlayerData = .init()
    
    private(set) var player: [[String: Any]] = [
        [ "id" : 0, "name" : "Kim", "age" : 20, "height" : 180.5, "weight" : 70.0, "salary": 300000, "likeCount" : 2, "comment" : ["Hello", "Welcome"]],
        [ "id" : 1, "name" : "Park", "age" : 30, "height" : 160.3, "weight" : 55.5, "salary": 100000, "likeCount" : 5, "comment" : []],
        [ "id" : 2, "name" : "Lee", "age" : 40, "height" : 177.4, "weight" : 67.3, "salary": 200000, "likeCount" : 11, "comment" : ["London", "NewYork", "Seoul"]],
        [ "id" : 3, "name" : "Choi", "age" : 50, "height" : 190.0, "weight" : 78.9, "salary": 600000, "likeCount" : 12, "comment" : ["iPhone", "Android"]],
        [ "id" : 4, "name" : "Yun", "age" : 60, "height" : 183.7, "weight" : 99.9, "salary": 90000, "likeCount" : 99, "comment" : ["Green", "Yellow", "Black"]]
    ]
    
    private func getPlayerIndex(id: Int) -> Int? {
        let index = player.firstIndex(where: { $0["id"] as? Int == id })
        return index
    }
    
    // MARK: Create
    func createComment(id: Int, comment: String) {
        if let index = getPlayerIndex(id: id) {
            player[index]["comment"] = comment
        }
    }
    
    // MARK: Read
    func getPlayer(id: Int) -> [String: Any] {
        if let index = getPlayerIndex(id: id) {
            let player = player[index]
            return player
        }
    }
    
    // MARK: Update
    func updateName(id: Int, name: String) {
        if let index = getPlayerIndex(id: id) {
            player[index]["name"] = name
        }
    }
    

}
