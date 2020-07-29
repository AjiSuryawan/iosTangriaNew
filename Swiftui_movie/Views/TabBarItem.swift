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
    //Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    var body: some View {
        VStack(spacing:0) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(5)
                .frame(width: 40, height: 40, alignment: .center)
                .background(Color(self.currentView == tab ? #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1) : .white).opacity(0.5))
                .foregroundColor(Color(self.currentView == tab ? .white : #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
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
