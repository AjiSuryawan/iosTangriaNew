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
    var movie: Movie
    var body: some View {
        ScrollView{
            VStack{
                VStack {
                    URLImage(URL(string:  ("http://admin.tangriaspa.com/"+movie.image))!, delay: 0.25) { proxy in
                        proxy.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.bottom)
                        
                    }
                    Text(movie.name)
                        .font(.title)
                        .foregroundColor(.black)
                    
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
                
            }
        }
        
    }
}
