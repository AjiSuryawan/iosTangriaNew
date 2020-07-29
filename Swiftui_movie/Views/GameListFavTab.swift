

import SwiftUI

// swiftlint:disable multiple_closures_with_trailing_closure
struct GameListFavTab: View {
    
    
    var body: some View {
        //NavigationView {
        VStack{
            Text("makanan")
            
        }        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .background(Color(.white))
            .navigationBarTitle("My Profile",displayMode: .inline)
        
        
    }
}

struct GameListFavTab_Previews: PreviewProvider {
    static var previews: some View {
        GameListFavTab()
    }
}
