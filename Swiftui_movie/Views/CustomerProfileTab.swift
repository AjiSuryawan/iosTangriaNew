

import SwiftUI

// swiftlint:disable multiple_closures_with_trailing_closure
struct CustomerProfileTab: View {
    @State private var navBarHidden = true
    @State var DetailHistoryBooking = false
    @State var DetailMedquest = false
    @State private var activateLink: Bool = false
    @State private var currentView: Tab = .Tab1
    @State private var showModal: Bool = false
    @State var isPresented = false
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
                    
                    Button(action: {
                        self.DetailHistoryBooking.toggle()
                    }) {
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
                    }.sheet(isPresented: $DetailHistoryBooking) {
                        HistoryBooking()
                    }
                    
                    Button(action: {
                        self.DetailMedquest.toggle()
                    }) {
                        VStack {
                            HStack {
                                VStack(alignment: .center, spacing: 0) {
                                    Text("Medical Questional")
                                        .foregroundColor(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                                        .frame(maxWidth: .infinity)
                                }.layoutPriority(100)
                                Spacer()
                            }.padding()
                        }
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), lineWidth: 2))
                        .padding()
                    }.sheet(isPresented: $DetailMedquest) {
                        MedicalQusetioner()
                    }
                    
                    
                    
//                    NavigationLink(destination: LoginM()) {
//                        if self.userSettings.email.isEmpty || self.userSettings.email == ""{
//                            LoginButtonContent()
//
//                        }else{
//
//                            LogoutButtonContent()
                    //                        }
                    //                    }
                    NavigationLink(destination: Login(), isActive: $activateLink, label: { EmptyView() })
                    Button(action: {
//                        UserDefaults.standard.removeObject(forKey: "username")
//                        UserDefaults.standard.removeObject(forKey: "email")
//                        UserDefaults.standard.removeObject(forKey: "desc")
                        
                        self.isPresented=true
                    }) {
                        LogoutButtonContent()
                    }
                }
                .alert(isPresented: $isPresented) {
                    Alert(title: Text("Logout"), message: Text("Are you sure want to Logout ?"), primaryButton: .destructive(Text("yes")) {
                        self.unpairAndSetDefaultDeviceInformation()
                        UserDefaults.standard.removeObject(forKey: "username")
                        UserDefaults.standard.removeObject(forKey: "email")
                        UserDefaults.standard.removeObject(forKey: "desc")
                        }, secondaryButton: .cancel())
                }
            }
            
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.white))
        .navigationBarTitle("Customer Profile",displayMode: .inline)
    }
    
    func unpairAndSetDefaultDeviceInformation() {
        // YOUR CODE IS HERE
        DispatchQueue.main.async {
            self.activateLink = true
        }
    }
    
    
    struct LogoutButtonContent: View {
        var body: some View {
            Text("Log Out")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.black)
                .cornerRadius(35.0)
        }
    }
    
    
    
    struct LoginButtonContent: View {
        var body: some View {
            Text("Login")
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
