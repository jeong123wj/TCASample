//
//  UserListView.swift
//  TCASample
//
//  Created by Woojin on 10/27/24.
//

import SwiftUI
import ComposableArchitecture
import Swinject

struct UserListView: View {
    let store: StoreOf<UserListFeature>
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(self.store.userArray) { user in
                    HStack {
                        Image(user.image).userImageStyle()
                        
                        Text(user.name).userNameTextStyle()
                        
                        Spacer()
                        
                        Button {
                            self.store.send(.followButtonTapped(user: user))
                        } label: {
                            if user.isFollowing {
                                FollowingText()
                            } else {
                                FollowText()
                            }
                        }
                    }
                    
                    Color.gray.frame(height: 1)
                }
            }
            .userListScrollViewStyle()
            .navigationTitle("User List")
            .onAppear {
                self.store.send(.viewAppear)
            }
        }
    }
}

// MARK: - custom view

private struct FollowText: View {
    var body: some View {
        Text("Follow")
            .foregroundStyle(.white)
            .font(.system(size: 14))
            .frame(width: 100, height: 36)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

private struct FollowingText: View {
    var body: some View {
        Text("Following")
            .foregroundStyle(.blue)
            .font(.system(size: 14))
            .frame(width: 100, height: 36)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .strokeBorder(.blue, lineWidth: 1)
            )
    }
}

// MARK: - style extension

private extension Text {
    func userNameTextStyle() -> some View {
        self.foregroundStyle(.black)
            .font(.system(size: 20))
            .padding([.horizontal], 4)
    }
}

private extension Image {
    func userImageStyle() -> some View {
        self.resizable()
            .circleFrame(size: 50)
    }
}

private extension ScrollView {
    func userListScrollViewStyle() -> some View {
        self.padding([.horizontal], 10)
            .padding([.top], 10)
    }
}

// MARK: - Preview

#Preview {
    Assembler.shared.resolver.resolve(UserListView.self)
}
