//
//  StubUpdateFollowUseCase.swift
//  TCASampleTests
//
//  Created by Woojin on 11/18/24.
//

import Foundation

@testable import TCASample

class StubUpdateFollowUseCase: UpdateFollowUseCase {
    private let updateFollowResult: UpdateFollowResult
    
    init(updateFollowResult: UpdateFollowResult = UpdateFollowResult(id: "", isFollowing: false)) {
        self.updateFollowResult = updateFollowResult
    }
    
    func execute(userId: String, isFollowing: Bool) async throws -> UpdateFollowResult {
        return self.updateFollowResult
    }
}
