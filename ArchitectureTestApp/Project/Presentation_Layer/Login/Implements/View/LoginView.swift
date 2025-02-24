//
//  LoginView.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/22/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var presenter: LoginPresenter
    
    var body: some View {
        HStack(spacing: 10) {
            Button {
                presenter.didTapUserLogin()
            } label: {
                Text("사용자로 로그인")
            }
            
            Button {
                presenter.didTapAdmainLogin()
            } label: {
                Text("관리자로 로그인")
            }
        }
    }
}
