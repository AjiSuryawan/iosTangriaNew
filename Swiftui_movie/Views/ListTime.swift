//
//  Product.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 28/07/20.
//  Copyright © 2020 Liem Vo. All rights reserved.
//

import Foundation
import SwiftUI

struct ListTime: View {
    var dateFormatter: DateFormatter{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }
    @State private var pickedDate = Date()
    
    
    var body: some View {
        VStack {
            //Text("\(dateFormatter.string(from: pickedDate))")
            
            DatePicker(selection: $pickedDate, in: ClosedRange(uncheckedBounds: (lower: Date(), upper: Date(timeIntervalSinceNow: 9000000))), displayedComponents: .date, label: {
                EmptyView()
                }).labelsHidden().padding()
            
            Button(action: { }, label: {
              Text("Get Available Time")
            }).padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
            List {
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
            }
            Button(action: {
                print("Book Now")
            }) {
                Text("Book Now")
                
                .frame(maxWidth: .infinity)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                
                .background(Color.green)
                .cornerRadius(15.0)
            }.padding()


        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.white))
        .navigationBarTitle("Available Time",displayMode: .inline)
        
    }
    
}



struct ListTime_Previews: PreviewProvider {
    static var previews: some View {
        ListTime()
    }
}
