//
//  ScreenModal.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 05/07/20.
//  Copyright © 2020 Liem Vo. All rights reserved.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        NavigationView {
            VStack{
                Image("aji")
                    .resizable()
                    .frame(width: 90.0, height: 120.0)
                    .scaledToFit()
                Form {
                    Section(header: Text("PROFILE")) {
                        TextField("Username", text: $userSettings.username)
                        TextField("Email", text: $userSettings.email)
                        TextField("Desc", text: $userSettings.desc)
                        
                    }
                }
                
            }
            .navigationBarTitle("Settings")
        }
    }
}




struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
