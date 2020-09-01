//
//  Register.swift
//  Swiftui_movie
//
//  Created by Aji Suryawan on 28/08/20.
//  Copyright © 2020 Liem Vo. All rights reserved.
//

import Foundation
import SwiftUI

struct ServerMessageRegist : Decodable {
    let success : String
    let user_id : Int
    //let role : Int
}

struct cekstatusmessage : Decodable {
    let success : String
}




func registpostAdd(job : String ,phone : String ,nama : String ,email : String , password : String, completion:@escaping(String , String)->()) {
    
    let url = URL(string: "https://api-ios.admin.tangriaspa.com/api/user/signup")
    let bodi: [String : String] = ["job" : job ,"phone" : phone ,"name" : nama ,"email" : email , "password" : password , "fcm_token" : "123"]
    
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
            
            let cekstatusgagal = try! JSONDecoder().decode(cekstatusmessage.self , from : data)
            if cekstatusgagal.success == "false" {
                print("regist gagal 1")
                completion("status","false")
            }else{
                
                let finalData = try! JSONDecoder().decode(ServerMessageRegist.self , from : data)
                //print(finalData.success)
                completion(String(finalData.success),String(finalData.user_id))
                print(String(data: data, encoding: .utf8) ?? "")
                
            }
        } else {
            completion("404","error")
        }
    }.resume()
    
}


struct Register: View {
    @State private var showingAlert = false
    @ObservedObject var userSettings = UserSettings()
    @State private var isAlert = false
    @State var isPresented = false
    @State private var showDetails = false
    @State var username: String = ""
    @State var password: String = ""
    @State var phone: String = ""
    @State var job: String = ""
    @State var namalengkap: String = ""
    var body: some View {
        LoadingView(isShowing: .constant(showDetails)) {
            ZStack  {
                VStack {
                    NamaLengkapTextField(namalengkap: self.$namalengkap)
                    UsernameTextField(username: self.$username)
                    JobTextField(job: self.$job)
                    PhoneTextField(phone: self.$phone)
                    PasswordTextField(password: self.$password)
                    Button(action: {
                        self.isPresented=true
                    }) {
                        RegistButtonContent()
                    }
                    .disabled(self.username.isEmpty || self.namalengkap.isEmpty || self.job.isEmpty || self.phone.isEmpty || self.password.isEmpty)
                    .alert(isPresented: self.$isPresented) {
                        Alert(title: Text("Registrasi"), message: Text("Data sudah benar ?"), primaryButton: .destructive(Text("yes")) {
                            self.showDetails = true
                            registpostAdd(job: self.job, phone : self.phone ,nama : self.namalengkap ,email: self.username, password: self.password) { data, data2 in
                                print("makanan "+String(data) + " , minuman : "+String(data2))
                                
                                if String(data2) == "false"{
                                    self.showingAlert = true
                                    self.showDetails = false
                                    print("regist gagal 2")
                                    
                                }else{
                                    self.userSettings.email = self.username
                                    self.userSettings.username = self.namalengkap
                                    self.userSettings.desc = self.job
                                    
                                    self.showDetails = false
                                    self.isAlert = true
                                }
                                
                                
                            }
                            }, secondaryButton: .cancel())
                    }
                    Button(action: {
                    }) {
                        EmptyView()
                    }.alert(isPresented: self.$showingAlert) {
                        Alert(title: Text("Registrasi gagal"), message: Text("Email already taken"), dismissButton: .default(Text("oke")))
                    }
                    
                }
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .background(Color(.white))
                .navigationBarTitle("Register",displayMode: .inline)
                
                if self.isAlert {
                    MainView()
                }
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
    
    struct RegistButtonContent: View {
        var body: some View {
            Text("Register")
                
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
    
    struct NamaLengkapTextField: View {
        
        @Binding var namalengkap: String
        
        var body: some View {
            TextField("Nama Lengkap", text: $namalengkap)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .disableAutocorrection(true)
                .autocapitalization(.none)
        }
    }
    
    struct JobTextField: View {
        
        @Binding var job: String
        
        var body: some View {
            TextField("Job", text: $job)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .disableAutocorrection(true)
                .autocapitalization(.none)
        }
    }
    
    struct PhoneTextField: View {
        
        @Binding var phone: String
        
        var body: some View {
            TextField("Phone Number", text: $phone)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .keyboardType(.numberPad)
        }
    }
    
    struct PasswordTextField: View {
        
        @Binding var password: String
        
        var body: some View {
            TextField("Password", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .disableAutocorrection(true)
                .autocapitalization(.none)
        }
    }
    
    
}
