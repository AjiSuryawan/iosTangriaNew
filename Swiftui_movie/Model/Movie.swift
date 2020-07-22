//
//  Movie.swift
//  Swiftui_movie
//
//  Created by Liem Vo on 7/7/19.
//  Copyright © 2019 Liem Vo. All rights reserved.
//

import Foundation

struct Movie: Decodable, Identifiable {
	var rating: Float
	var rating_top: Int
	var id: Int
	//var vote_average: Float
	var name: String
	var background_image: String
	var slug: String
	var released: String
	var tba: Bool
}
