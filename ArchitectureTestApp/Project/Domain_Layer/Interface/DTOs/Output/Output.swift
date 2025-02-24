//
//  Output.swift
//  ArchitectureTestApp
//
//  Created by Yun on 2/20/25.
//

import Foundation

@frozen public enum Output<Success, Failure> {
    case onSuccess(output: Success)
    case onFailure(error: Failure)
}
