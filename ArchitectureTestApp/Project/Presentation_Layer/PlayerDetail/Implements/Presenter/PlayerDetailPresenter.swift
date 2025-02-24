//
//  PlayerDetailPresenter.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/23/25.
//

import Foundation

class PlayerDetailPresenter: ObservableObject {
    private let playerDetailUseCase: PlayerDetailUseCase
    
    // MARK: 의존성 주입 문제 체크!!
    init(id: Int) {
        let repository: PlayerRepositoryImpl = .init()
        let mapper: PlayerMapper = .init()
        let getPlayerUseCase: GetPlayerUseCaseImpl = .init(repository: repository, mapper: mapper)
        let addCommentUseCase: AddCommentUseCaseImpl = .init(repository: repository)
        let editPlayerUseCase: EditPlayerUseCaseImpl = .init()
        let playerDetailUseCase: PlayerDetailUseCaseImpl = .init(getPlayerUseCase: getPlayerUseCase, addCommentUseCase: addCommentUseCase, editPlayer: editPlayerUseCase)
        
        self.id = id
        self.playerDetailUseCase = playerDetailUseCase
    }
    
    private let id: Int
    
    // AView ViewModel State
    @Published private(set) var name: String = ""
    @Published private(set) var age: Int = 0
    @Published private(set) var height: Double = 0
    @Published private(set) var weight: Double = 0
    
    // BView ViewModel State
    @Published private(set) var salary: Int? = nil
    @Published private(set) var likeCount: Int = 0
    @Published private(set) var comment: [String] = []
    
    // API 호출 플래그
    // 데이터 옵셔널로도 처리 가능
    @Published private(set) var isLoading: Bool = false
    
    // 댓글 Text State
    @Published var text: String = ""
    
    @MainActor
    func getPlayerDetail() async {
        let input: GetPlayerInput = .init(id: self.id)
        
        // MARK: CallAsFunction 사용할 경우
        // playerDetailUseCase.editPlayer(input: Input)으로 사용가능
        let exampleOutput: Bool = playerDetailUseCase.editPlayer(input: "")
        
        let output: Output<GetPlayerOutput, Error> = await playerDetailUseCase.getPlayerUseCase.execute(input: input)
        
        switch output {
        case .onSuccess(let output):
            self.name = output.name
            self.age = output.age
            self.height = output.height
            self.weight = output.weight
            self.salary = output.salary
            self.likeCount = output.likeCount
            self.comment = output.comment
            
            self.isLoading = true
            
        case .onFailure(let error):
            print(error)
        }
    }
    
    @MainActor
    func addComment() async {
        let input: AddCommentInput = .init(id: self.id, comment: self.text)
        
        let output: Output<Void, Error> = await playerDetailUseCase.addCommentUseCase.execute(input: input)
        
        switch output {
        case .onSuccess(_):
            let _ = await updateComment()
            self.text = ""
        case .onFailure(let error):
            print(error)
        }
    }
    
    @MainActor
    func updateComment() async {
        let input: GetPlayerInput = .init(id: self.id)
        
        let output: Output<GetPlayerOutput, Error> = await playerDetailUseCase.getPlayerUseCase.execute(input: input)
        
        switch output {
        case .onSuccess(let output):
            self.comment = output.comment
            
        case .onFailure(let error):
            print(error)
        }
    }
}
