//
//  Product.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 28/07/20.
//  Copyright © 2020 Liem Vo. All rights reserved.
//

import Foundation
import SwiftUI

struct MedicalQusetioner: View {
    
    
    
    var body: some View {
        VStack {
            Text("MedQuest here")
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.white))
        .navigationBarTitle("Medical Questioner",displayMode: .inline)
        
    }
    
}



struct MedicalQusetioner_Previews: PreviewProvider {
    static var previews: some View {
        MedicalQusetioner()
    }
}
