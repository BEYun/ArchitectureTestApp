//
//  LoginPresenter.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/23/25.
//

import Foundation

class LoginPresenter: ObservableObject {
    let coordinateAction: LoginCoordinateAction?
    
    init(coordinateAction: LoginCoordinateAction?) {
        self.coordinateAction = coordinateAction
    }
    
    func didTapUserLogin() {
        let isAdmin: Bool = false
        coordinateAction?.moveToPlayerListFeature(with: isAdmin)
    }
    
    func didTapAdmainLogin() {
        let isAdmin: Bool = true
        coordinateAction?.moveToPlayerListFeature(with: isAdmin)
    }
}
