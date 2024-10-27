//
//  FetchUserListUseCase.swift
//  TCASample
//
//  Created by Woojin on 10/26/24.
//

import Foundation

class FetchUserListUseCase {
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute() async throws -> [User] {
        return try await self.userRepository.fetchUserList()
    }
}
