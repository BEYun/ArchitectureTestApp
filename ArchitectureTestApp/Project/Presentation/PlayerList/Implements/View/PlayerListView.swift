//
//  PlayerListView.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/22/25.
//

import SwiftUI

struct PlayerListView: View {
    @StateObject var presenter: PlayerListPresenter
    
    var body: some View {
        NavigationStack {
            List(presenter.playerList, id: \.id) { player in
                NavigationLink(destination: {
                    PlayerDetailView(id: player.id)
                        .environment(\.isAdmin, presenter.isAdmin)
                }) {
                    HStack {
                        Text(player.name)
                            .padding()
                        
                        Spacer()
                        
                        Text("좋아요 \(player.likeCount)개")
                            .padding()
                            .foregroundStyle(.yellow)
                            .bold()
                    }
                }
            }
            .navigationTitle("선수 목록")
        }
        .task {
            await presenter.fetchPlayerList()
        }
    }
}
