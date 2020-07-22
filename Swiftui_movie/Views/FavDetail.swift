//
//  FavDetail.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 18/07/20.
//  Copyright © 2020 Liem Vo. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage
struct FavDetail : View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    
    let movie: Gameku
    var body: some View {
        
        ScrollView {
            VStack {
                URLImage(URL(string:  (movie.pic ?? "https://media.rawg.io/media/games/328/3283617cb7d75d67257fc58339188742.jpg"))!, delay: 0.25) {proxy in
                    proxy.image.resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.height/8*3, height: UIScreen.main.bounds.height/2)
                }
                HStack {
                    Text("Title").foregroundColor(.gray)
                    Spacer()
                }
                movie.title.map(Text.init)
                Spacer()
                HStack {
                    Text("Description").foregroundColor(.gray)
                    Spacer()
                }
                movie.genre.map(Text.init)
                Spacer()
                
            }
        }.padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
    }
    
    
    static let releaseFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    
    
}
