//
//  MovieRow.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 03/07/20.
//  Copyright © 2020 RPL RUS. All rights reserved.
//

import URLImage
import SwiftUI

struct MovieRowApi : View {
    var movie: Movie
    //http://admin.tangriaspa.com/img/product/Tangria%20Hot%20Stonesc708d6ee460e820aa39c19eab69961f3e12de932.jpg
    var body: some View {
        ZStack{
            VStack {
                URLImage(URL(string:  ("http://admin.tangriaspa.com/"+movie.image))!, delay: 0.25) { proxy in
                    proxy.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom)
                    
                }
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        
                        Text(movie.name)
                            .font(.title)
                            .foregroundColor(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                        
                        Text("Rp. "+String(movie.price))
                            .font(.headline)
                            .foregroundColor(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                        
                        
                    }.layoutPriority(100)
                    
                    Spacer()
                }.padding()
            }
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 1))

            NavigationLink(destination: MovieDetailsApi(movie: movie)) {
                    EmptyView()
            }.buttonStyle(PlainButtonStyle())
            
            
        }
    }
}
