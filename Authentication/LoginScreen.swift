//
//  LoginScreen.swift
//  Authentication
//
//  Created by Raj Aryan on 26/03/23.
//

import SwiftUI
import Firebase


struct LoginScreen: View {
    @State var email_text: String = ""
    @State var password_text: String = ""
    @State var email_message: String = "Email"
    @State var password_message: String = "Password"
    @State var showingAlert = false
    @State var isLoggedIn = false
    private var key = "isslab"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BrandBlue")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 320, height: 70, alignment: .center)
                        .foregroundColor(.white)
                        .overlay(
                            TextField(email_message, text: $email_text)
                                .foregroundColor(Color("BrandBlue"))
                                .font(.system(size: 20))
                                .multilineTextAlignment(.center)
                                .textInputAutocapitalization(.never)
                        )
                    
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 320, height: 70, alignment: .center)
                        .foregroundColor(.white)
                        .overlay(
                            SecureField(password_message, text: $password_text)
                                .foregroundColor(Color("BrandBlue"))
                                .font(.system(size: 20))
                                .multilineTextAlignment(.center)
                                .textInputAutocapitalization(.never)
                        )
                    
                    Button {
                        
                        Auth.auth().signIn(withEmail: email_text, password: vigenereEncrypt(password_text, withKey: key)) { authResult, error in
                            if let e = error {
                                email_text = ""
                                password_text = ""
                                showingAlert = true
                                print(e)
                            } else {
                                isLoggedIn = true
                            }
                        }
                        
                    } label: {
                        Text("Login")
                            .font(.system(size: 20))
                            .padding()
                            .foregroundColor(.white)
                    }

                    
                    
                    NavigationLink(destination: AfterLoginView().navigationBarBackButtonHidden(true), isActive: $isLoggedIn) {
                        EmptyView()
                    }
                    
                    Spacer()
                    
                }.offset(y: 100)
                
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("Some error occurred"), message: Text("Try entering email and password again"), dismissButton: .default(Text("Got it!")))
            }
        }
    }
}
struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
