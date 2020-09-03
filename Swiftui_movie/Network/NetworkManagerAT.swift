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
		//loadDataByAlamofireAT(date: "2020-09-17", ordername: "Tangria Hot Stones")
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
	
    public func loadDataByAlamofireAT(date : String , ordername : String) {
        let url = URL(string: "https://api-ios.admin.tangriaspa.com/api/available-time")
        let bodi: [String : String] = ["date" : date ,"ordername" : ordername]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: bodi)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                print("Content-Type: \(response.allHeaderFields["Content-Type"] ?? "")")
                print("statusCode: \(response.statusCode)")
                let movies = try! JSONDecoder().decode(atlist.self, from: data)
                DispatchQueue.main.async {
                    self.movies = movies
                    self.loading = false
                }
            } else {
                
            }
        }.resume()
	}
}
//DispatchQueue.main.async {
//    self.movies = movies
//    self.loading = false
//}
