//
//  Coordinator.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/23/25.
//

import Foundation

class Coordinator: ObservableObject {
    enum Path: Equatable {
        case login
        case playerList(isAdmin: Bool)
    }
    
    @Published var path: Path = .login
}

// MARK: 로그인 코디네이터 액션
extension Coordinator: LoginCoordinateAction {
    func moveToPlayerListFeature(with isAdmin: Bool) {
        self.path = .playerList(isAdmin: isAdmin)
    }
}
