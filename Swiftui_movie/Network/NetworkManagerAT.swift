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

class NetworkManagerAT: ObservableObject {
    
	@Published var movies = atlist(result: [])
	@Published var loading = false
    
    let api_url_base = "https://api-ios.admin.tangriaspa.com/api/available-time"
    
    init() {
		loading = true
		loadDataByAlamofire(date: "date nya", ordername: "nama order")
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
	
    private func loadDataByAlamofire(date : String , ordername : String) {
        let parameters = ["date": date, "ordername": ordername]
        Alamofire.request(api_url_base, parameters: parameters)
			.responseJSON{ response in
				guard let data = response.data else { return }
				let movies = try! JSONDecoder().decode(atlist.self, from: data)
				DispatchQueue.main.async {
					self.movies = movies
					self.loading = false
				}
		}
	}
}
