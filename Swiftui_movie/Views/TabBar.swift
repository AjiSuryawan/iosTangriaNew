//
//  TabBar.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 05/07/20.
//  Copyright © 2020 Liem Vo. All rights reserved.
//

import Foundation
import SwiftUI

struct TabBar: View {
    @Binding var currentView: Tab
    @Binding var showModal: Bool

    var body: some View {
        HStack {
            TabBarItem(currentView: self.$currentView, imageName: "folder.circle", paddingEdges: .leading, tab: .Tab1)
            Spacer()
            ShowModalTabBarItem(radius: 55) { self.showModal.toggle() }
            Spacer()
            TabBarItem(currentView: self.$currentView, imageName: "heart.fill", paddingEdges: .trailing, tab: .Tab2)
        }
        .frame(minHeight: 70)
        .background(Color.blue)
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(currentView: .constant(.Tab1), showModal: .constant(false))
    }
}
