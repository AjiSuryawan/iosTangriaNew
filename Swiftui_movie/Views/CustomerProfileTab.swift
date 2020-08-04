

import SwiftUI

// swiftlint:disable multiple_closures_with_trailing_closure
struct CustomerProfileTab: View {
    @State private var isAlert = false
    @ObservedObject var userSettings = UserSettings()
    var body: some View {
        VStack{
            ScrollView{
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
                                    //.fontWeight(.bold)
                                    .foregroundColor(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                                
                                Text(userSettings.desc)
                                    .font(.headline)
                                    //.fontWeight(.bold)
                                    .foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
                            }.layoutPriority(100)
                            Spacer()
                        }.padding()
                    }
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 1))
                    .padding()
                    NavigationLink(destination: HistoryBooking()) {
                        VStack {
                            HStack {
                                VStack(alignment: .center, spacing: 0) {
                                    Text("History Booking")
                                        .foregroundColor(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                                    .frame(maxWidth: .infinity)
                                }.layoutPriority(100)
                                Spacer()
                            }.padding()
                        }
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), lineWidth: 2))
                        .padding()
                    }
                    
                    NavigationLink(destination: MedicalQusetioner()) {
                        VStack {
                            
                            HStack {
                                VStack(alignment: .center, spacing: 0) {
                                    
                                    Text("Medical Questioner")
                                        .foregroundColor(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                                    .frame(maxWidth: .infinity)
                                    
                                }.layoutPriority(100)
                                
                                Spacer()
                            }.padding()
                        }
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), lineWidth: 2))
                        .padding()
                    }
                    
                    Button(action: {
                        self.isAlert = true
                        UserDefaults.standard.removeObject(forKey: "username")
                        UserDefaults.standard.removeObject(forKey: "email")
                        UserDefaults.standard.removeObject(forKey: "desc")
                    }) {
                        LogoutButtonContent()
                    }
                }
            }
            
            if self.isAlert{
                    SplashScreen()
                
            }
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.white))
        .navigationBarTitle("Customer Profile",displayMode: .inline)
    }
    
    struct LogoutButtonContent: View {
        var body: some View {
            Text("log out")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.black)
                .cornerRadius(35.0)
        }
    }
    
    struct GameListFavTab_Previews: PreviewProvider {
        static var previews: some View {
            CustomerProfileTab()
        }
    }
    
}
