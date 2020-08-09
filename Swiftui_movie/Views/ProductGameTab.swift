//
//  Screen1.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 05/07/20.
//  Copyright © 2020 Liem Vo. All rights reserved.
//

import Foundation
import SwiftUI

struct ProductGameTab: View {
    var body: some View {
        VStack {
            ScrollView {
                ForEach(places, id: \.self) { place in
                    CardView(image: place.image, title: place.title, city: place.city, des: place.desc , urlspa: place.urlspa)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.white))
        .navigationBarTitle("Our Product",displayMode: .inline)
//        .navigationBarItems(trailing:
//            NavigationLink(destination: ProfileView()) {
//                Text("").foregroundColor(.white)
//            }.buttonStyle(PlainButtonStyle())
//        )
    }
    
}



struct ProductGameTab_Previews: PreviewProvider {
    static var previews: some View {
        ProductGameTab()
    }
}
