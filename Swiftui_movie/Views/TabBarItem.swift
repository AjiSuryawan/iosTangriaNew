//
//  TabBarItem.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 05/07/20.
//  Copyright © 2020 Liem Vo. All rights reserved.
//

import Foundation
import SwiftUI

struct TabBarItem: View {
    @Binding var currentView: Tab
    let imageName: String
    let paddingEdges: Edge.Set
    let tab: Tab
    
    var body: some View {
        VStack(spacing:0) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(5)
                .frame(width: 40, height: 40, alignment: .center)
                .background(Color(self.currentView == tab ? .blue : .white).opacity(0.2))
                .foregroundColor(Color(self.currentView == tab ? .white : .blue))
                .cornerRadius(6)
        }
        .frame(width: 100, height: 50)
        .onTapGesture { self.currentView = self.tab }
        .padding(paddingEdges, 15)
    }
}

struct TabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItem(currentView: .constant(.Tab1), imageName: "gear", paddingEdges: .leading, tab: .Tab1)
    }
}
