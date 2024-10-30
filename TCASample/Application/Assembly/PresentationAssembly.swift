//
//  PresentationAssembly.swift
//  TCASample
//
//  Created by Woojin on 10/30/24.
//

import Foundation
import Swinject
import ComposableArchitecture

class PresentationAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UserListView.self) { resolver in
            let userListFeature = resolver.resolve(UserListFeature.self)!
            let userListFeatureState = resolver.resolve(UserListFeature.State.self)!
            return UserListView(
                store: Store(initialState: userListFeatureState) {
                    userListFeature
                }
            )
        }
        
        container.register(UserListFeature.self) { resolver in
            let fetchUserListUseCase = resolver.resolve(FetchUserListUseCase.self)!
            let updateFollowUseCase = resolver.resolve(UpdateFollowUseCase.self)!
            return UserListFeature(fetchUserListUseCase: fetchUserListUseCase, updateFollowUseCase: updateFollowUseCase)
        }
        
        container.register(UserListFeature.State.self) { resolver in
            return UserListFeature.State()
        }
    }
}
