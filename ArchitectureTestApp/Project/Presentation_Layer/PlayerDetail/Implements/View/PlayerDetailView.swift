//
//  PlayerDetailView.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/23/25.
//

import SwiftUI

struct PlayerDetailView: View {
    @StateObject var persenter: PlayerDetailPresenter
    @Environment(\.isAdmin) var isAdmin
    
    init(id: Int) {
        self._persenter = StateObject(wrappedValue: PlayerDetailPresenter(id: id))
    }
    
    var body: some View {
        if !persenter.isLoading {
            ProgressView("선수 정보 불러오는 중...")
                .task {
                    await persenter.getPlayerDetail()
                }
            
        } else {
            VStack(alignment: .leading, spacing: 15) {
                Text("* 선수 정보 *")
                    .font(.title)
                    .padding(.bottom, 20)
                
                Text("이름 : \(persenter.name)")
                Text("나이 : \(persenter.age)세")
                Text("키 : \(Int(persenter.height))cm")
                Text("몸무게 : \(Int(persenter.weight))kg")
                if let salary = persenter.salary,
                   self.isAdmin {
                    Text("연봉 : \(salary)원")
                        .font(.headline)
                        .foregroundStyle(.yellow)
                }
                
                Text("* 댓글 *")
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(persenter.comment, id:\.self) { comment in
                        Text(comment)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal, 12)
                .background(.blue)
                
                if !self.isAdmin {
                    TextField("댓글을 입력하세요", text: $persenter.text)
                        .onSubmit {
                            Task {
                                await persenter.addComment()
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
