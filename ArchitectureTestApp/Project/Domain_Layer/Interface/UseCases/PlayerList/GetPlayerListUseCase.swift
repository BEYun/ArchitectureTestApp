//
//  GetPlayerListUseCase.swift
//  ArchitectureTestApp
//
//  Created by Yun on 2/20/25.
//

import Foundation

public protocol GetPlayerListUseCase {
    func execute() async -> Output<GetPlayerListOutput, Error>
}
