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
    @State private var isAlert = false
    @State private var countryindex = 0
    var countries = ["10.00", "11.00" , "13.00", "14.00", "16.00" , "18.00"];
    @State var singleIsPresented = false
    var rkManager1 = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0)
    var rkManager3 = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 3)
    var rkManager4 = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0)
    @State var selectedDate = Date()
    var body: some View {
        ZStack{
            VStack {
                Button(action: { self.singleIsPresented.toggle() }) {
                    Text("Silahkan Pilih Tanggal").foregroundColor(.blue)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
                .sheet(isPresented: self.$singleIsPresented, content: {
                    RKViewController(isPresented: self.$singleIsPresented, rkManager: self.rkManager1)}
                )
                if self.getTextFromDate(date: self.rkManager1.selectedDate) == "kosongan" {
                    
                }else{
                    Text(self.getTextFromDate(date: self.rkManager1.selectedDate))
                        .padding()
                    //koding ambil tanggal
                    Text("jam yang anda pilih : "+self.countries[countryindex])
                    Picker (selection: $countryindex, label: EmptyView()) {
                        ForEach(0..<countries.count) {
                            Text(self.countries[$0])
                                .tag($0)
                        }
                    }
                    Button(action: {
                        print("Book Now")
                        self.isAlert = true
                    }) {
                        Text("Book Now")
                            
                            .frame(maxWidth: .infinity)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(15.0)
                    }.disabled(countryindex < 0)
                }
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color(.white))
            .navigationBarTitle("Available Time",displayMode: .inline)
            .onAppear(perform: startUp)
            .navigationViewStyle(StackNavigationViewStyle())
            
            if self.isAlert {
                MainView()
            }
            
        }
    }
    func startUp() {
        
        // example of pre-setting selected dates
        let testOnDates = [Date().addingTimeInterval(60*60*24), Date().addingTimeInterval(60*60*24*2)]
        rkManager3.selectedDates.append(contentsOf: testOnDates)
        
        // example of some foreground colors
        rkManager3.colors.weekdayHeaderColor = Color.blue
        rkManager3.colors.monthHeaderColor = Color.green
        rkManager3.colors.textColor = Color.blue
        rkManager3.colors.disabledColor = Color.red
        
        // example of pre-setting disabled dates
        let testOffDates = [
            Date().addingTimeInterval(60*60*24*4),
            Date().addingTimeInterval(60*60*24*5),
            Date().addingTimeInterval(60*60*24*7)]
        rkManager4.disabledDates.append(contentsOf: testOffDates)
    }
    
    func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "EEEE, dd MMMM yyyy"
        return date == nil ? "kosongan" : formatter.string(from: date)
    }
    
}



struct ListTime_Previews: PreviewProvider {
    static var previews: some View {
        ListTime()
    }
}
