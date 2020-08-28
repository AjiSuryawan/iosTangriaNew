//
//  MainView.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 05/07/20.
//  Copyright © 2020 Liem Vo. All rights reserved.
//

import Foundation
import SwiftUI

struct MainView: View {
    @State private var currentView: Tab = .Tab1
    @State private var showModal: Bool = false
    

    var body: some View {
        //NavigationView {
            VStack {
                CurrentScreen(currentView: self.$currentView)
                TabBar(currentView: self.$currentView, showModal: self.$showModal)
            }
            .navigationBarBackButtonHidden(true)
    
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = .white
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.systemPink]
            })
            
            
        //}
            
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: self.$showModal) { ProfileView() }
        
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
