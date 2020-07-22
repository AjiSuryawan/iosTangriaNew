//
//  MovieDetails.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 03/07/20.
//  Copyright © 2020 RPL RUS. All rights reserved.
//

import SwiftUI
import URLImage
import CoreData
struct MovieDetailsApi : View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var movie: Movie
    var body: some View {
        ScrollView {
            VStack {
                Button(action: {
                    self.addGameku(title: self.movie.name, genre: String(self.movie.rating_top), releaseDate: self.movie.released, pic: self.movie.background_image)
                    
                }) {
                    HStack {
                        Image(systemName: "bookmark.fill")
                        Text("Bookmark")
                    }.padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                    )
                }
                
                Spacer()
                URLImage(URL(string:  (movie.background_image))!, delay: 0.25) {proxy in
                    proxy.image.resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.height/8*3, height: UIScreen.main.bounds.height/2)
                }
                HStack {
                    Text("Title").foregroundColor(.gray)
                    Spacer()
                }
                Text(movie.name).lineLimit(nil)
                Spacer()
                HStack {
                    Text("Description").foregroundColor(.gray)
                    Spacer()
                }
                Text(movie.released).lineLimit(nil)
                Spacer()
                
            }.navigationBarTitle(Text(movie.name), displayMode: .inline)
                .padding()
        }.padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
    }
    
    func addGameku(title: String, genre: String, releaseDate: String, pic : String) {
        // 1
        print(title)
        print(genre)
        print(releaseDate)
        print(pic)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Gameku", in: context)
        let newMovie = NSManagedObject(entity: entity!, insertInto: context)
        
        newMovie.setValue(title, forKey: "title")
        newMovie.setValue(genre, forKey: "genre")
        newMovie.setValue(releaseDate, forKey: "releaseDate")
        newMovie.setValue(pic, forKey: "pic")
        
        do {
            try context.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
    
    
    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
    
}

