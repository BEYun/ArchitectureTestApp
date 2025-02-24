//
//  Response + Player.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/22/25.
//

import Foundation

public struct GetPlayerResponseDTO: Decodable {
    let id: Int
    let name: String
    let age: Int
    let height: Double
    let weight: Double
    let salary: Int?
    let likeCount: Int
    let comment: [String]
}
