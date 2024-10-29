//
//  UpdateFollowUseCase.swift
//  TCASample
//
//  Created by Woojin on 10/30/24.
//

import Foundation

class UpdateFollowUseCase {
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute(userId: String, isFollowing: Bool) async throws -> UpdateFollowResult {
        return try await self.userRepository.updateFollow(userId: userId, isFollowing: isFollowing)
    }
}
