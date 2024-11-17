//
//  UpdateFollowUseCase.swift
//  TCASample
//
//  Created by Woojin on 10/30/24.
//

import Foundation

protocol UpdateFollowUseCase {
    func execute(userId: String, isFollowing: Bool) async throws -> UpdateFollowResult
}
