//
//  SplashScreen.swift
//  LoginApi
//
//  Created by Aji Suryawan on 02/08/20.
//  Copyright © 2020 RPL RUS. All rights reserved.
//

import Foundation
import SwiftUI

struct SplashScreen: View {
    @State private var navBarHidden = true
    @ObservedObject var userSettings = UserSettings()
    var body: some View {
        NavigationView{
            VStack {
                if self.userSettings.email.isEmpty || self.userSettings.email == "" {
                    //NavigationView {
                    Login()
                    //}
                }else{
                    //NavigationView {
                    MainView()
                    //}
                }
            }
        }
    }
}
