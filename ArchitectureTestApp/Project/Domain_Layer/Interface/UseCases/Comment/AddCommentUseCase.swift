//
//  AddCommentUseCase.swift
//  ArchitectureTestApp
//
//  Created by Yun on 2/20/25.
//

import Foundation

public protocol AddCommentUseCase {
    func execute(input: AddCommentInput) async -> Output<Void, Error>
}
