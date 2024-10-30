//
//  TCASampleApp.swift
//  TCASample
//
//  Created by Woojin on 10/26/24.
//

import SwiftUI
import ComposableArchitecture
import Swinject

@main
struct TCASampleApp: App {
    init() {
        Assembler.shared.apply(assemblies: [
            PresentationAssembly(),
            DomainAssembly()
        ])
    }
    
    var body: some Scene {
        WindowGroup {
            Assembler.shared.resolver.resolve(UserListView.self)
        }
    }
}
