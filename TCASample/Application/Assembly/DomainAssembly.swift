//
//  DomainAssembly.swift
//  TCASample
//
//  Created by Woojin on 10/30/24.
//

import Foundation
import Swinject

class DomainAssembly: Assembly {
    func assemble(container: Container) {
        container.register(FetchUserListUseCase.self) { resolver in
            let userRepository = resolver.resolve(UserRepository.self)!
            return DefaultFetchUserListUseCase(userRepository: userRepository)
        }
        
        container.register(UpdateFollowUseCase.self) { resolver in
            let userRepository = resolver.resolve(UserRepository.self)!
            return DefaultUpdateFollowUseCase(userRepository: userRepository)
        }
        
        container.register(UserRepository.self) { resolver in
            return FakeUserRepository()
        }
        .inObjectScope(.container)
    }
}
