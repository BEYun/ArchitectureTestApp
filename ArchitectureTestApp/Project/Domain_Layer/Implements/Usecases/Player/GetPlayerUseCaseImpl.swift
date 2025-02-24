//
//  GetPlayerUseCaseImpl.swift
//  ArchitectureTestApp
//
//  Created by Yun on 2/21/25.
//

import Foundation

class GetPlayerUseCaseImpl: GetPlayerUseCase {
    let repository: PlayerRepository
    let mapper: PlayerMapperInterface
    
    init(repository: PlayerRepository, mapper: PlayerMapperInterface) {
        self.repository = repository
        self.mapper = mapper
    }
    
    func execute(input: GetPlayerInput) async -> Output<GetPlayerOutput, Error> {
        do {
            let requestDTO: GetPlayerRequestDTO = .init(id: input.id)
            
            let responseDTO: GetPlayerResponseDTO = try await repository.getPlayer(requestDTO: requestDTO)
            
            // 1) DTO를 Entity로 초기화(매핑 또는 팩토리 패턴 사용)
            let player: Player = mapper.mapping(dto: responseDTO)
            
            // 2) Entity의 비즈니스 로직 수행(예시)
            let isValid: Bool = player.validate()
            
            guard isValid else {
                return .onFailure(error: DomainError.invalidEntity)
            }
            
            // 3) Presentation Layer에서 사용하는 Output으로 매핑
            let output: GetPlayerOutput = mapper.mapping(entity: player)
            
            return .onSuccess(output: output)
            
        } catch {
            // 실패에 대한 특정 타입을 생성하여 Presentation Layer에서 에러 핸들링
            // 예시로 DomainError.APIError
            return .onFailure(error: DomainError.APIError)
        }
        
    }
}
