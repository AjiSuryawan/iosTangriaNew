//
//  ContentView.swift
//  LoginApi
//
//  Created by Aji Suryawan on 01/08/20.
//  Copyright © 2020 RPL RUS. All rights reserved.
//

import SwiftUI
import Combine
let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)



struct ServerMessage : Decodable {
    let success : String
    let user_id : Int
    let role : Int
}

struct checkStatusOnly : Decodable {
    let success : String
}



func postAdd(email : String , password : String, completion:@escaping(String, String)->()) {
    
    let url = URL(string: "https://api-ios.admin.tangriaspa.com/api/user/login")
    let bodi: [String : String] = ["email" : email , "password" : password , "fcm_token" : "123"]
    
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
            
            let cekstatus = try! JSONDecoder().decode(checkStatusOnly.self , from : data)
            if cekstatus.success == "false" {
                completion("status","false")
            }else{
                let finalData = try! JSONDecoder().decode(ServerMessage.self , from : data)
                print(finalData.success)
                completion(String(finalData.success),String(finalData.user_id))
                print(String(data: data, encoding: .utf8) ?? "")
            }
            
            
        } else {
            completion("404","error")
        }
    }.resume()
    
}


struct Login: View {
    @State private var showingAlert = false
    @State private var selectedTab = 0
    @ObservedObject var userSettings = UserSettings()
    @State private var showDetails = false
    @State private var isAlert = false
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        LoadingView(isShowing: .constant(showDetails)) {
            ZStack  {
                //ScrollView{
                VStack{
                    Image("applogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150.0,height:150)
                    UsernameTextField(username: self.$username)
                    PasswordSecureField(password: self.$password)
                    Button(action: {
                        self.showDetails = true
                        print(self.username)
                        print(self.password)
                        postAdd(email: self.username, password: self.password) { data, data2 in
                            print("makanan "+String(data) + " , minuman : "+String(data2))
                            
                            if String(data2) == "false"{
                                self.showDetails = false
                                self.showingAlert = true
                            }else{
                                self.userSettings.email = self.username
                                self.userSettings.username = data
                                self.userSettings.desc = data2
                                
                                self.showDetails = false
                                self.isAlert = true
                            }
                            
                        }
                    }) {
                        LoginButtonContent()
                    }.disabled(self.username.isEmpty || self.password.isEmpty)
                    
                    NavigationLink(destination: Register()) {
                        Text("Register")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
                    }.padding()
                }
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .background(Color(.white))
                //.navigationBarTitle("",displayMode: .inline)
                    .alert(isPresented: self.$showingAlert) {
                    Alert(title: Text("Login gagal"), message: Text("Login gagal, silahkan cek email dan password anda"), dismissButton: .default(Text("oke")))
                }
                //}
                
                if self.isAlert {
                    MainView()
                }
            }.navigationBarBackButtonHidden(true)
            
        }
        
    }
    
}

struct ActivityIndicator: UIViewRepresentable {
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
struct LoadingView<Content>: View where Content: View {
    
    @Binding var isShowing: Bool
    var content: () -> Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                
                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)
                
                VStack {
                    Text("Loading...")
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                    .background(Color.secondary.colorInvert())
                    .foregroundColor(Color.primary)
                    .cornerRadius(20)
                    .opacity(self.isShowing ? 1 : 0)
                
            }
        }
    }
    
}

struct LoginButtonContent: View {
    var body: some View {
        Text("Login")
            
            .frame(maxWidth: .infinity)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            
            .background(Color.green)
            .cornerRadius(15.0)
    }
}


struct UsernameTextField: View {
    
    @Binding var username: String
    
    var body: some View {
        TextField("Email", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            .disableAutocorrection(true)
            .autocapitalization(.none)
    }
}

struct PasswordSecureField: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            .disableAutocorrection(true)
            .autocapitalization(.none)
    }
}

//struct Loading_Previews: PreviewProvider {
//    static var previews: some View {
//        Login()
//    }
//}
//                    Image("applogo")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .padding(.bottom)
