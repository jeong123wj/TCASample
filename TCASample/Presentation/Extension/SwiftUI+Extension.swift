//
//  SwiftUI+Extension.swift
//  TCASample
//
//  Created by Woojin on 10/29/24.
//

import Foundation
import SwiftUI

extension Image {
    func circleFrame(size: CGFloat) -> some View {
        self.frame(width: size, height: size)
            .clipShape(Circle())
    }
}
