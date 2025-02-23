//
//  PlayerDetailView.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/23/25.
//

import SwiftUI

struct PlayerDetailView: View {
    @StateObject var viewModel: PlayerDetailPresenter
    @Environment(\.isAdmin) var isAdmin
    
    init(id: Int) {
        self._viewModel = StateObject(wrappedValue: PlayerDetailPresenter(id: id))
    }
    
    var body: some View {
        if !viewModel.isLoading {
            ProgressView("선수 정보 불러오는 중...")
                .task {
                    await viewModel.getPlayerDetail()
                }
            
        } else {
            VStack(alignment: .leading, spacing: 15) {
                Text("* 선수 정보 *")
                    .font(.title)
                    .padding(.bottom, 20)
                
                Text("이름 : \(viewModel.name)")
                Text("나이 : \(viewModel.age)세")
                Text("키 : \(Int(viewModel.height))cm")
                Text("몸무게 : \(Int(viewModel.weight))kg")
                if let salary = viewModel.salary,
                   self.isAdmin {
                    Text("연봉 : \(salary)원")
                        .font(.headline)
                        .foregroundStyle(.yellow)
                }
                
                Text("* 댓글 *")
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(viewModel.comment, id:\.self) { comment in
                        Text(comment)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal, 12)
                .background(.blue)
                
                if !self.isAdmin {
                    TextField("댓글을 입력하세요", text: $viewModel.text)
                        .onSubmit {
                            Task {
                                await viewModel.addComment()
                            }
                        }
                        .border(.gray)
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
        }
    }
}

private struct IsAdminKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var isAdmin: Bool {
        get { self[IsAdminKey.self] }
        set { self[IsAdminKey.self] = newValue }
    }
}
