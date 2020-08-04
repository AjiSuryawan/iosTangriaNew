//
//  Place.swift
//  SimpleCardView
//
//  Created by shiga on 06/04/20.
//  Copyright © 2020 shiga. All rights reserved.
//

import Foundation


struct Place: Hashable {
    
    let image: String
    let title: String
    let city: String
    let desc:String
    let urlspa : String
    
}


let places = [
    Place(image: "spa1", title: "Package Treadment", city: "Tangria", desc: "" , urlspa: "api/product/package_treatment"),
    
    Place(image: "spa1", title: "Ala Carte Treadment", city: "Tangria", desc: "" , urlspa: "api/product/ala_carte_treatment")
    
    
]
