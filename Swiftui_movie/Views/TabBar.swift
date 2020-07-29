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
            TabBarItem(currentView: self.$currentView, imageName: "star", paddingEdges: .leading, tab: .Tab1)
            Spacer()
            //ShowModalTabBarItem(radius: 55) { self.showModal.toggle() }
            TabBarItem(currentView: self.$currentView, imageName: "calendar", paddingEdges: .trailing, tab: .Tab3)
            Spacer()
            TabBarItem(currentView: self.$currentView, imageName: "person", paddingEdges: .trailing, tab: .Tab2)
        }
        .frame(minHeight: 70)
        .background(Color.white)
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(currentView: .constant(.Tab1), showModal: .constant(false))
    }
}
