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

class NetworkManagerAlacarte: ObservableObject {
    
	@Published var movies = MovieList(result: [])
	@Published var loading = false
    
    let api_url_base = "https://api-ios.admin.tangriaspa.com/api/product/ala_carte_treatment"
    
    init() {
		loading = true
		loadDataByAlamofire()
	}
	
//	private func loadDataNormal() {
//		guard let url = URL(string: (api_url_base)) else { return }
//		URLSession.shared.dataTask(with: url){ (data, _, _) in
//			guard let data = data else { return }
//			let movies = try! JSONDecoder().decode(MovieList.self, from: data)
//			DispatchQueue.main.async {
//				self.movies = movies
//				self.loading = false
//			}
//		}.resume()
//	}
	
	private func loadDataByAlamofire() {
        
        Alamofire.request((api_url_base))
			.responseJSON{ response in
				guard let data = response.data else { return }
				let movies = try! JSONDecoder().decode(MovieList.self, from: data)
				DispatchQueue.main.async {
					self.movies = movies
					self.loading = false
				}
		}
	}
}
