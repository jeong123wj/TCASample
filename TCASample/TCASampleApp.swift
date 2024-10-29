//
//  TCASampleApp.swift
//  TCASample
//
//  Created by Woojin on 10/26/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCASampleApp: App {
    var body: some Scene {
        WindowGroup {
            UserListView(
                store: Store(initialState: UserListFeature.State()) {
                    UserListFeature()
                }
            )
        }
    }
}
