//
//  History.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 29/07/20.
//  Copyright © 2020 Liem Vo. All rights reserved.
//

import SwiftUI

// swiftlint:disable multiple_closures_with_trailing_closure
struct History: View {
    
     //@ObservedObject var networkManager = NetworkManagerHour()
    var body: some View {
        //NavigationView {
        VStack{
            Text("makanan ini enak")
//            if networkManager.loading {
//                Text("Loading ...")
//                    .foregroundColor(Color.pink)
//                    .bold()
//                    .frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .center)
//            } else {
//
//                List(networkManager.movies.time) { movie in
//                    RowHourOff(movie: movie)
//                    //                    NavigationLink(destination: MovieDetailsApi(movie: movie)){
//                    //                        MovieRowApi(movie: movie)
//                    //                    }
//                }.onAppear {
//                    UITableView.appearance().separatorStyle = .none
//                }
//            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.white))
        .navigationBarTitle("History Booking",displayMode: .inline)
        
        
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
