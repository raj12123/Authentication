//
//  WelcomeScreen.swift
//  Authentication
//
//  Created by Raj Aryan on 26/03/23.
//

import SwiftUI
import UIKit

struct WelcomeScreen: View {
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                Text("Authentication App")
                    .foregroundColor(.blue)
                    .bold()
                    .font(.system(size: 32))
                    .multilineTextAlignment(.center)
                Spacer()
                
                NavigationLink {
                    RegisterScreen()
                } label: {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 70)
                        .foregroundColor(Color("BrandLightBlue"))
                        .overlay(
                            Text("Register")
                                .foregroundColor(Color("BrandBlue"))
                                .font(.system(size: 30))
                        )
                }
                
                NavigationLink {
                    LoginScreen()
                } label: {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 70)
                        .foregroundColor(Color("BrandBlue"))
                        .overlay(
                            Text("Login")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                             )
                }
                
               
            }.padding()
        }
    }

}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
