//
//  LoginCoordinateAction.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/23/25.
//

import Foundation

public protocol LoginCoordinateAction {
    func moveToPlayerListFeature(with isAdmin: Bool)
}
