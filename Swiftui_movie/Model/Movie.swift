//
//  Movie.swift
//  Swiftui_movie
//
//  Created by Liem Vo on 7/7/19.
//  Copyright © 2019 Liem Vo. All rights reserved.
//

import Foundation

struct Movie: Decodable, Identifiable {
	//var rating: Float
	var price: Int
	var id: Int
	//var vote_average: Float
	var name: String
	var image: String
	var description: String
	var note: String
	//var tba: Bool
}
