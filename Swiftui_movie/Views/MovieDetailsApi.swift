//
//  MovieDetails.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 03/07/20.
//  Copyright © 2020 RPL RUS. All rights reserved.
//

import SwiftUI
import URLImage
import CoreData
struct MovieDetailsApi : View {
    @State var isPresented = false
    var movie: Movie
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    VStack {
                        URLImage(URL(string:  ("http://admin.tangriaspa.com/"+movie.image))!, placeholder: { _ in
                            Image("spa1")             // Use different image for the placeholder
                                .resizable()                        // Make it resizable
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom)
                        }) { proxy in
                            proxy.image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom)
                        }
                        Text(movie.name)
                            .font(.title)
                            .foregroundColor(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                    }
                    .cornerRadius(2)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 1))
                    .padding()
                    Spacer()
                    Text(movie.note)
                        .foregroundColor(.green)
                        .padding()
                    Spacer()
                    Text(movie.description)
                        .foregroundColor(.black)
                        .padding()
                    Spacer()
                    NavigationLink(destination: ListTime()) {
                        Text("Book Now")
                            .frame(maxWidth: .infinity)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(15.0)
                    }.padding()
                    
//                    Button(action: {
//                        self.isPresented.toggle()
//                        print("Button action")
//                    }) {
//                        Text("Book Now")
//                            .frame(maxWidth: .infinity)
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.green)
//                            .cornerRadius(15.0)
//                    }.padding()
                    Spacer()
                }
//                .sheet(isPresented: $isPresented) {
//                    ListTime()
//                }
            }
            
        }
        
        
    }
}

//Button(action: {}) {
//    Text("Book now")
//        .font(.headline)
//        .foregroundColor(.white)
//        .padding()
//
//        .background(Color.green)
//        .cornerRadius(15.0)
//
//}.padding(.top, 50)
