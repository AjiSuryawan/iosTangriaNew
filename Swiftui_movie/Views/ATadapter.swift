//
//  MovieRow.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 03/07/20.
//  Copyright © 2020 RPL RUS. All rights reserved.
//

import URLImage
import SwiftUI

struct ATadapter : View {
    var movie: availabletime
    var body: some View {
        ZStack{
            HStack {
                Image(systemName: "calendar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(5)
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
                    .cornerRadius(6)
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 0){
                        
                        Text(movie.time)
                            .foregroundColor(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                            .font(.system(size: 15))
                        
                    }.layoutPriority(100)
                    Spacer()
                }.padding()
                
                
            }
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 1))
            
        }
    }
}
