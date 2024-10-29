//
//  User.swift
//  TCASample
//
//  Created by Woojin on 10/26/24.
//

import Foundation

struct User: Identifiable, Equatable {
    let id: String
    let name: String
    let image: String
    let isFollowing: Bool
}
