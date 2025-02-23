//
//  PlayerRepository.swift
//  ArchitectureTestApp
//
//  Created by Yun on 2/21/25.
//

import Foundation

public protocol PlayerRepository {
    func getPlayer(requestDTO: GetPlayerRequestDTO) async throws -> GetPlayerResponseDTO
    func addPlayer() async throws -> Bool
    func editPlayer() async throws -> Bool
    func deletePlayer() async throws -> Bool
    
    func getPlayerList() async throws -> GetPlayerListResponseDTO
    
    func addComment(requestDTO: AddCommentRequestDTO) async -> Bool
}
