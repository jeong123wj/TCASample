//
//  FakeUserRepository.swift
//  TCASample
//
//  Created by Woojin on 10/26/24.
//

import Foundation

class FakeUserRepository: UserRepository {
    func fetchUserList() async throws -> [User] {
        return [
            User(id: UUID().uuidString, name: "James", image: "UserImage01", isFollowing: true),
            User(id: UUID().uuidString, name: "Linda", image: "UserImage02", isFollowing: false),
            User(id: UUID().uuidString, name: "Mark", image: "UserImage03", isFollowing: false),
        ]
    }
    
    func updateFollow(userId: String, isFollowing: Bool) async throws -> UpdateFollowResult {
        return UpdateFollowResult(id: userId, isFollowing: isFollowing)
    }
}
