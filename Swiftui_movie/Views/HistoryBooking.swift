//
//  Product.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 28/07/20.
//  Copyright © 2020 Liem Vo. All rights reserved.
//

import Foundation
import SwiftUI

struct HistoryBooking: View {
    
    
    
    var body: some View {
        VStack {
            Text("History Booking Here")
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.white))
        .navigationBarTitle("History Booking",displayMode: .inline)
        
    }
    
}



struct HistoryBooking_Previews: PreviewProvider {
    static var previews: some View {
        HistoryBooking()
    }
}
