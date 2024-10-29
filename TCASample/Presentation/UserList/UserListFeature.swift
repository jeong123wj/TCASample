//
//  UserListFeature.swift
//  TCASample
//
//  Created by Woojin on 10/27/24.
//

import ComposableArchitecture

@Reducer
struct UserListFeature {
    let fetchUserListUseCase = FetchUserListUseCase(userRepository: MockUserRepository())
    
    @ObservableState
    struct State: Equatable {
        var userArray: [User] = []
    }
    
    enum Action {
        case viewAppear
        case fetchUserListResponse(userList: [User])
        case followButtonTapped(userId: String)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .viewAppear:
                return .run { send in
                    let userList = try await self.fetchUserListUseCase.execute()
                    await send(.fetchUserListResponse(userList: userList))
                }
                
            case let .fetchUserListResponse(userList):
                state.userArray = userList
                return .none
                
            case let .followButtonTapped(userId):
                if let index = state.userArray.firstIndex(where: { $0.id == userId }) {
                    let user = state.userArray[index]
                    state.userArray[index] = User(id: user.id, name: user.name, image: user.image, isFollowing: !user.isFollowing)
                }
                return .none
            }
        }
    }
}
