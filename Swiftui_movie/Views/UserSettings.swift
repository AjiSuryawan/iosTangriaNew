//
//  UserSettings.swift
//  nyobainUserDefault
//
//  Created by Aji Suryawan on 22/07/20.
//  Copyright © 2020 RPL RUS. All rights reserved.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    @Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }
    
    @Published var email: String {
        didSet {
            UserDefaults.standard.set(email, forKey: "email")
        }
    }
    
    @Published var desc: String {
        didSet {
            UserDefaults.standard.set(desc, forKey: "desc")
        }
    }
    
    init() {
        self.username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
        self.email = UserDefaults.standard.object(forKey: "email") as? String ?? ""
        self.desc = UserDefaults.standard.object(forKey: "desc") as? String ?? ""
    }
}
