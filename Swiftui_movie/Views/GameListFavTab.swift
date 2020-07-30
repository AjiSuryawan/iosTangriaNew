

import SwiftUI

// swiftlint:disable multiple_closures_with_trailing_closure
struct GameListFavTab: View {
    
    
    var body: some View {
        //NavigationView {
        VStack{
            Image("aji")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .padding()
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("name")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                    
                    Text("email")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
                    
                    
                }.layoutPriority(100)
                
                Spacer()
            }.padding()
            
        }   .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .background(Color(.white))
            .navigationBarTitle("My Profile",displayMode: .inline)
        
        
    }
}

struct GameListFavTab_Previews: PreviewProvider {
    static var previews: some View {
        GameListFavTab()
    }
}

