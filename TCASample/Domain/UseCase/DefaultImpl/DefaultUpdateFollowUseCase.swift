//
//  DefaultUpdateFollowUseCase.swift
//  TCASample
//
//  Created by Woojin on 11/17/24.
//

import Foundation

class DefaultUpdateFollowUseCase: UpdateFollowUseCase {
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute(userId: String, isFollowing: Bool) async throws -> UpdateFollowResult {
        return try await self.userRepository.updateFollow(userId: userId, isFollowing: isFollowing)
    }
}
