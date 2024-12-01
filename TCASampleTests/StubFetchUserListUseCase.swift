//
//  StubFetchUserListUseCase.swift
//  TCASampleTests
//
//  Created by Woojin on 11/18/24.
//

import Foundation

@testable import TCASample

class StubFetchUserListUseCase: FetchUserListUseCase {
    private let userList: [User]
    
    init(userList: [User] = []) {
        self.userList = userList
    }
    
    func execute() async throws -> [User] {
        return self.userList
    }
}
