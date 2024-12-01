//
//  TCASampleTests.swift
//  TCASampleTests
//
//  Created by Woojin on 10/26/24.
//

import ComposableArchitecture

import XCTest
@testable import TCASample

final class TCASampleTests: XCTestCase {
    @MainActor
    func testFetchUserList() async throws {
        let stubFetchUserListUseCase = StubFetchUserListUseCase(userList: [User(id: "id", name: "name", image: "", isFollowing: false)])
        
        let testStore = TestStore(initialState: UserListFeature.State()) {
            UserListFeature(fetchUserListUseCase: stubFetchUserListUseCase, updateFollowUseCase: StubUpdateFollowUseCase())
        }
        
        await testStore.send(\.viewAppear)
        await testStore.receive(\.fetchUserListResponse) {
            $0.userArray = [User(id: "id", name: "name", image: "", isFollowing: false)]
        }
    }
    
    @MainActor
    func testUpdateFollow() async throws {
        let stubUpdateFollowUseCase = StubUpdateFollowUseCase(updateFollowResult: UpdateFollowResult(id: "id", isFollowing: true))
        let initialState = UserListFeature.State(userArray: [User(id: "id", name: "name", image: "", isFollowing: false)])
        
        let testStore = TestStore(initialState: initialState) {
            UserListFeature(fetchUserListUseCase: StubFetchUserListUseCase(), updateFollowUseCase: stubUpdateFollowUseCase)
        }
        
        await testStore.send(\.followButtonTapped, User(id: "id", name: "name", image: "", isFollowing: false))
        await testStore.receive(\.updateFollowResponse) {
            $0.userArray = [User(id: "id", name: "name", image: "", isFollowing: true)]
        }
    }
}
