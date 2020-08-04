

import SwiftUI

// swiftlint:disable multiple_closures_with_trailing_closure
struct CustomerProfileTab: View {
    
    @ObservedObject var userSettings = UserSettings()
    var body: some View {
        VStack{
            Image("aji")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
            .padding()
            VStack {
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        
                        Text(userSettings.email)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                        
                        Text(userSettings.desc)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
                        
                        
                    }.layoutPriority(100)
                    
                    Spacer()
                }.padding()
            }
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 1))
            .padding()
        }     .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .background(Color(.white))
            .navigationBarTitle("Customer Profile",displayMode: .inline)
        
    }
    
    struct GameListFavTab_Previews: PreviewProvider {
        static var previews: some View {
            CustomerProfileTab()
        }
    }
    
}
