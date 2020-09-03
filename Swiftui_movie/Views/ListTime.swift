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
    @State private var countryindex = 0
    @ObservedObject var networkManager = NetworkManagerAT()
    var id: Int
    var name: String
    @State var isPresented = false
    @State private var showDetails = false
    @State private var isAlert = false
    @State var singleIsPresented = false
    var rkManager1 = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0)
    var rkManager3 = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 3)
    var rkManager4 = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0)
    @State var selectedDate = Date()
    var body: some View {
        LoadingView(isShowing: .constant(showDetails)) {
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
                        if self.networkManager.loading {
                            Text("Loading ...")
                            .foregroundColor(Color.pink)
                            .bold()
                            //NETWORKING DISINI, KALAU SUKSES NGUBAH STATUS
                            
                            
                            
//                            Button(action: {
//                                self.statusambiljam=false
//                                print("Book Now")
//                                //self.showDetails = true
//                                //self.isAlert = true
//
//                            }) {
//                                Text("change")
//
//                                    .frame(maxWidth: .infinity)
//                                    .font(.headline)
//                                    .foregroundColor(.white)
//                                    .padding()
//                                    .background(Color.green)
//                                    .cornerRadius(15.0)
//                            }
                        }else{
                            Text(self.getTextFromDate(date: self.rkManager1.selectedDate))
                                .padding()
                            
                            Text("jam yang anda pilih : "+self.networkManager.movies.result[self.countryindex].time)
                            Picker (selection: self.$countryindex, label: EmptyView()) {
                                ForEach(0..<self.networkManager.movies.result.count) {
                                    Text(self.networkManager.movies.result[$0].time)
                                        .tag($0)
                                }
                            }.labelsHidden()
                            
                            //self.networkManager.movies.result
//                            List(self.networkManager.movies.result) { movie in
//                                ATadapter(movie: movie)
//
//                            }.onAppear {
//                                UITableView.appearance().separatorStyle = .none
//                            }
                            
                            Button(action: {
                                self.isPresented=true
                                print("Book Now : "+String(self.id)+" "+self.name)
                                
                                //self.showDetails = true
                                //self.isAlert = true
                                
                            }) {
                                Text("Book Now")
                                    
                                    .frame(maxWidth: .infinity)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.green)
                                    .cornerRadius(15.0)
                            }.disabled(self.countryindex < 0)
                            .alert(isPresented: self.$isPresented) {
                                Alert(title: Text("Confirm Booking"), message: Text("Apakah anda yakin ingin booking ?"), primaryButton: .destructive(Text("yes")) {
                                    self.showDetails = true
                                    //proses network
                                    //jika selesai muncul alert oke saja, info cek di booking
                                    //jika salah muncul alert lagi
                                    }, secondaryButton: .cancel())
                            }
                        }
                    }
                }
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
                .background(Color(.white))
                .navigationBarTitle("Available Time",displayMode: .inline)
                .onAppear(perform: self.startUp)
                .navigationViewStyle(StackNavigationViewStyle())
                
                if self.isAlert {
                    MainView()
                }
                
            }
        }
        
    }
    
    struct ActivityIndicator: UIViewRepresentable {
        
        @Binding var isAnimating: Bool
        let style: UIActivityIndicatorView.Style
        
        func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
            return UIActivityIndicatorView(style: style)
        }
        
        func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
            isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        }
    }
    struct LoadingView<Content>: View where Content: View {
        
        @Binding var isShowing: Bool
        var content: () -> Content
        
        var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .center) {
                    
                    self.content()
                        .disabled(self.isShowing)
                        .blur(radius: self.isShowing ? 3 : 0)
                    
                    VStack {
                        Text("Loading...")
                        ActivityIndicator(isAnimating: .constant(true), style: .large)
                    }
                    .frame(width: geometry.size.width / 2,
                           height: geometry.size.height / 5)
                        .background(Color.secondary.colorInvert())
                        .foregroundColor(Color.primary)
                        .cornerRadius(20)
                        .opacity(self.isShowing ? 1 : 0)
                    
                }
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



//struct ListTime_Previews: PreviewProvider {
//    static var previews: some View {
//        ListTime()
//    }
//}
