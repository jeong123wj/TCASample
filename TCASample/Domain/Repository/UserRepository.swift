//
//  UserRepository.swift
//  TCASample
//
//  Created by Woojin on 10/26/24.
//

import Foundation

protocol UserRepository {
    func fetchUserList() async throws -> [User]
}
