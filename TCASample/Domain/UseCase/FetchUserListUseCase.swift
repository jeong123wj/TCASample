//
//  FetchUserListUseCase.swift
//  TCASample
//
//  Created by Woojin on 10/26/24.
//

import Foundation

protocol FetchUserListUseCase {
    func execute() async throws -> [User]
}
