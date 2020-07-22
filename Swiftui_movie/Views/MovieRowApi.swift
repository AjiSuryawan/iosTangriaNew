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
	
	var body: some View {
		HStack {
            URLImage(URL(string:  (movie.background_image))!, delay: 0.25) { proxy in
				proxy.image.resizable()
                    .scaledToFit()
					.frame(width: 90, height: 120)
				
			}
			
			VStack {
				Spacer()
				HStack {
                    Text(movie.name)
						.foregroundColor(.blue)
						.lineLimit(nil)
					Spacer()
				}
				
                HStack {
                    Text(movie.released).foregroundColor(.gray)
					Spacer()
                    Text("id: \(movie.id)")
				}
                 
				HStack {
                    Text("Vote count: \(movie.rating_top)")
						.foregroundColor(.gray)
						.lineLimit(nil)
					Spacer()
				}
				HStack {
                    Text("Popularity: \(movie.rating)")
						.foregroundColor(.gray)
						.lineLimit(nil)
					Spacer()
				}
				Spacer()
			}
		}.frame(height: 130)
	}
}





extension Float {
	func format() -> String {
		return String(format: "%.2f",self)
	}
}
