//
//  GetPlayerUseCase.swift
//  ArchitectureTestApp
//
//  Created by Yun on 2/20/25.
//

import Foundation

public protocol GetPlayerUseCase {
    func execute(with: GetPlayerInput) -> Output<GetPlayerOutput, String>
}
