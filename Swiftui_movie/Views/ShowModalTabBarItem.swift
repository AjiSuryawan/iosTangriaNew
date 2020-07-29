//
//  ShowModalTabBarItem.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 05/07/20.
//  Copyright © 2020 Liem Vo. All rights reserved.
//

import Foundation
import SwiftUI

public struct ShowModalTabBarItem: View {
    let radius: CGFloat
    let action: () -> Void

    public init(radius: CGFloat, action: @escaping () -> Void) {
        self.radius = radius
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing:0) {
            Image(systemName: "person.fill")
                .frame(width: radius, height: radius, alignment: .center)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .background(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
                .cornerRadius(radius/2)

        }
        .frame(width: radius, height: radius)
        .onTapGesture(perform: action)
    }
}

struct ShowModalTabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        ShowModalTabBarItem(radius: 55) { }
    }
}
