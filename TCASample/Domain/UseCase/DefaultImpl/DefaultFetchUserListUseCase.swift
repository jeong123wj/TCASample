//
//  DefaultFetchUserListUseCase.swift
//  TCASample
//
//  Created by Woojin on 11/17/24.
//

import Foundation

class DefaultFetchUserListUseCase: FetchUserListUseCase {
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute() async throws -> [User] {
        return try await self.userRepository.fetchUserList()
    }
}
