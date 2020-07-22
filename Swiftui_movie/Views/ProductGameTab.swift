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
    @ObservedObject var networkManager = NetworkManager()
    /*
    var body: some View {
        NavigationView {
            VStack {
                if networkManager.loading {
                    Text("Loading ...")
                } else {
                    List(networkManager.movies.results) { movie in
                        NavigationLink(destination: MovieDetails(movie: movie)){
                            MovieRow(movie: movie)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Movies"))
        }
    }
    */
    
    var body: some View {
        VStack {
            if networkManager.loading {
                Text("Loading ...")
                    .foregroundColor(Color.black)
                .bold()
            } else {
                List(networkManager.movies.results) { movie in
                    NavigationLink(destination: MovieDetailsApi(movie: movie)){
                        MovieRowApi(movie: movie)
                    }
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.white))
            
        .navigationBarTitle("Produk", displayMode: .inline)
//        .navigationBarItems(trailing:
//            NavigationLink(destination: ProfileView()) {
//                Text("cari").foregroundColor(.white)
//            }.buttonStyle(PlainButtonStyle())
//        )
    }
    
}



struct ProductGameTab_Previews: PreviewProvider {
    static var previews: some View {
        ProductGameTab()
    }
}
