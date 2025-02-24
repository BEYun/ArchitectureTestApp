//
//  GetPlayerListUseCaseImpl.swift
//  ArchitectureTestApp
//
//  Created by 윤병은 on 2/22/25.
//

import Foundation

class GetPlayerListUseCaseImpl: GetPlayerListUseCase {
    let repository: PlayerRepository
    let mapper: PlayerMapperInterface
    
    init(repository: PlayerRepository, mapper: PlayerMapperInterface) {
        self.repository = repository
        self.mapper = mapper
    }
    
    func execute() async -> Output<GetPlayerListOutput, Error> {
        do {
            let response = try await repository.getPlayerList()
            
            // 1) Entity 매핑
            let playerList: [Player] = mapper.mapping(dto: response)
            
            // 2) UseCase의 비즈니스 로직 수행
            // 예) 검증에 실패한 선수는 리스트에서 보여주지 않음
            let validatedPlayerList: [Player] = playerList.filter{ $0.validate() }
            
            // 3) Output으로 변환
            let output: GetPlayerListOutput = mapper.mapping(entity: validatedPlayerList)
            
            return .onSuccess(output: output)
            
        } catch {
            return .onFailure(error: DomainError.APIError)
        }
    }
    
    
}
