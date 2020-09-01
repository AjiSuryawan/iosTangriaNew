//
//  NetworkManager.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 03/07/20.
//  Copyright © 2020 RPL RUS. All rights reserved.
//

import Alamofire
import Foundation
import Combine

class NetworkManagerHour: ObservableObject {
	@Published var movies = HourOffList(time: [])
	@Published var loading = false
	//private let api_key = "26ca623415ed476f557880b39427f773"
	//private let api_url_base = "https://api.rawg.io/api/games"
    private let api_url_base = "https://api-ios.admin.tangriaspa.com/api/busy"
	init() {
		loading = true
		loadDataByAlamofire()
	}
	
	
	private func loadDataByAlamofire() {
		Alamofire.request((api_url_base))
			.responseJSON{ response in
				guard let data = response.data else { return }
				let movies = try! JSONDecoder().decode(HourOffList.self, from: data)
				DispatchQueue.main.async {
					self.movies = movies
					self.loading = false
				}
		}
	}
}
