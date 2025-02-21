//
//  PlayerRepository.swift
//  ArchitectureTestApp
//
//  Created by Yun on 2/21/25.
//

import Foundation

public protocol PlayerRepository {
    func getPlayer(id: Int) throws -> ResponseDTO
    func addPlayer() throws -> ResponseDTO
    func editPlayer() throws -> ResponseDTO
    func deletePlayer() throws -> ResponseDTO
}
