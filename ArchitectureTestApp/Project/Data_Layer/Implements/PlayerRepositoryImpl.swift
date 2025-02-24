//
//  PlayerRepositoryImpl.swift
//  ArchitectureTestApp
//
//  Created by Yun on 2/21/25.
//

import Foundation

class PlayerRepositoryImpl: PlayerRepository {
    func getPlayer(requestDTO: GetPlayerRequestDTO) async throws -> GetPlayerResponseDTO {
        // API 호출 지연(0.5초)
        try await Task.sleep(nanoseconds: 500_000_000)
        
        // API 호출(Raw Data),  ex) Dictionary
        let id = requestDTO.id
        let playerData: [String: Any] = try PlayerData.shared.getPlayer(id: id)
        let jsonData: Data = try JSONSerialization.data(withJSONObject: playerData, options: [])
        
        // APIResponse 모델로 매핑
        let response: APIResponse = .init(result: jsonData, status: 0)
        let data: Data = response.result
        
        // 커스텀 ResponseDTO로 매핑
        let dto = try JSONDecoder().decode(GetPlayerResponseDTO.self, from: data)
        
        return dto
    }
    
    func addPlayer() throws -> Bool {
        return true
    }
    
    func editPlayer() throws -> Bool {
        return true
    }
    
    func deletePlayer() throws -> Bool {
        return true
    }
}

// MARK: 선수 리스트 호출
extension PlayerRepositoryImpl {
    func getPlayerList() async throws -> GetPlayerListResponseDTO {
        typealias PlayerDTO = GetPlayerListResponseDTO.PlayerDTO
        
        // API 호출 지연(1초)
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        let playerList: [[String: Any]] = try PlayerData.shared.getPlayerList()
        let jsonData: Data = try JSONSerialization.data(withJSONObject: playerList, options: [])
        
        let response: APIResponse = .init(result: jsonData, status: 0)
        let data: Data = response.result
        
        let decodedData: [PlayerDTO] = try JSONDecoder().decode([PlayerDTO].self, from: data)
        
        let dto: GetPlayerListResponseDTO = .init(playerList: decodedData)
        
        return dto
    }
}

// MARK: 선수 댓글 추가
extension PlayerRepositoryImpl {
    func addComment(requestDTO: AddCommentRequestDTO) async -> Bool {
        do {
            // API 호출 지연(0.3초)
            try await Task.sleep(nanoseconds: 300_000_000)
            
            let id: Int = requestDTO.id
            let comment: String = requestDTO.comment
            
            let _ = try PlayerData.shared.addComment(id: id, comment: comment)
            
            return true
            
        } catch {
            return false
        }
    }
}

private class PlayerData {
    static var shared: PlayerData = .init()
    
    private(set) var player: [[String: Any]] = [
        [ "id" : 0, "name" : "Kim", "age" : 20, "height" : 180.5, "weight" : 70.0, "salary": 300000, "likeCount" : 99, "comment" : ["Hello", "Welcome"]],
        [ "id" : 1, "name" : "Park", "age" : 30, "height" : 160.3, "weight" : 55.5, "salary": 100000, "likeCount" : 5, "comment" : []],
        [ "id" : 2, "name" : "Lee", "age" : 40, "height" : 177.4, "weight" : 67.3, "salary": 200000, "likeCount" : 11, "comment" : ["London", "NewYork", "Seoul"]],
        [ "id" : 3, "name" : "Choi", "age" : 50, "height" : 190.0, "weight" : 78.9, "salary": 600000, "likeCount" : 12, "comment" : ["iPhone", "Android"]],
        [ "id" : 4, "name" : "Yun", "age" : 60, "height" : 183.7, "weight" : 99.9, "salary": 90000, "likeCount" : 9, "comment" : ["Green", "Yellow", "Black"]]
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
    func getPlayer(id: Int) throws -> [String: Any] {
        if let index = getPlayerIndex(id: id) {
            let player = player[index]
            return player
        } else {
            throw DomainError.APIError
        }
    }
    
    func getPlayerList() throws -> [[String: Any]] {
        return player.map { playerData in
            [
                "id": playerData["id"]!,
                "name": playerData["name"]!,
                "age": playerData["age"]!,
                "height": playerData["height"]!,
                "weight": playerData["weight"]!,
                "likeCount": playerData["likeCount"]!
            ]
        }
    }
    
    // MARK: Update
    func updateName(id: Int, name: String) {
        if let index = getPlayerIndex(id: id) {
            player[index]["name"] = name
        }
    }
    
    func addComment(id: Int, comment: String) throws {
        if let index = getPlayerIndex(id: id) {
            var comments: [String] = player[index]["comment"] as! [String]
            comments.append(comment)
            player[index]["comment"] = comments
        } else {
            throw DomainError.addCommentFailure
        }
    }

}

public enum DomainError: Error {
    case APIError
    case invalidEntity
    case addCommentFailure
}
