//
//  MainView.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/23/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var coordinator: Coordinator = .init()
    let dependency: DIContainer = .init()
    
    var body: some View {
        if coordinator.path == .login {
            let presenter: LoginPresenter = .init(coordinateAction: coordinator)
            LoginView(presenter: presenter)
            
        } else if case let .playerList(isAdmin) = coordinator.path {
            let presenter: PlayerListPresenter = dependency.makePlayerListPresenter(isAdmin: isAdmin)
            PlayerListView(presenter: presenter)
        }
    }
}
