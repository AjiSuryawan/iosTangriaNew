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
    
    @ObservedObject var networkManager = NetworkManagerHour()
    var body: some View {
        
        VStack {
            if networkManager.loading {
                Text("Loading ...")
                    .foregroundColor(Color.pink)
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .center)
            } else {
                
                List(networkManager.movies.time) { movie in
                    RowHourOff(movie: movie)
                    
                }.onAppear {
                    UITableView.appearance().separatorStyle = .none
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.white))
        .navigationBarTitle("Info Tutup",displayMode: .inline)
        
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
