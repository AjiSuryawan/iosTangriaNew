//
//  CurrentScreen.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 05/07/20.
//  Copyright © 2020 Liem Vo. All rights reserved.
//

import Foundation
import SwiftUI

struct CurrentScreen: View {
    @Binding var currentView: Tab

    var body: some View {
        VStack {
            if self.currentView == .Tab1 {
                ProductGameTab()
            } else {
                //Screen2()
                GameListFavTab().environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
                
            }
        }
    }
}

struct CurrentScreen_Previews: PreviewProvider {
    static var previews: some View {
        CurrentScreen(currentView: .constant(.Tab1))
    }
}
