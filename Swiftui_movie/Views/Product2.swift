//
//  Product.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 28/07/20.
//  Copyright © 2020 Liem Vo. All rights reserved.
//

import Foundation
import SwiftUI

struct Product2: View {
    @ObservedObject var networkManager = NetworkManagerAlacarte()
    
    var body: some View {
        VStack {
            if networkManager.loading {
                
                Text("Loading ...")
                    .foregroundColor(Color.pink)
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .center)
            } else {

                List(networkManager.movies.result) { movie in
                    MovieRowApi(movie: movie)
                    //                    NavigationLink(destination: MovieDetailsApi(movie: movie)){
                    //                        MovieRowApi(movie: movie)
                    //                    }
                }.onAppear {
                    UITableView.appearance().separatorStyle = .none
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.white))
        .navigationBarTitle("Ala Carte Treadment",displayMode: .inline)
        
    }
    
}



struct Product2_Previews: PreviewProvider {
    static var previews: some View {
        Product2()
    }
}
