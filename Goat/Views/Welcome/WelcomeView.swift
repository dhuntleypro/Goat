//
//  WelcomeView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI
import Firebase

struct WelcomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    @State var showSignUpWindow = true
    @State var showSignInWindow = false
    
    @State var email = ""
    @State var password = ""
    @State var confirmedPassword = ""
    
    @State var signInModalHeight : CGFloat = 600
    @State var signUpModalHeight : CGFloat = 500
    
    var body: some View {
        ZStack {
            
            // background
            Image("yawbg")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 1000)
                .edgesIgnoringSafeArea(.all)
                .overlay(Color(.black).opacity(0.2))
            VStack {
                Spacer()
                
                // TITLE
                VStack (alignment: .center , spacing: 20){
                    Text(BRAND_NAME)
                        .font(.system(size: 60 , weight: .bold))
                    
                }
                .foregroundColor(.white)
                
                Spacer()
                
                
                VStack(spacing: 10) {
                    Button(action: {
                        showSignUpWindow.toggle()
                    }) {
                        Text("Sign Up")
                            .foregroundColor(.black)
                            .bold()
                            .frame(width: 250, height: 50)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        showSignInWindow.toggle()
                    }) {
                        Text("Sign In")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 250, height: 50)
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                }
                
                Spacer().frame(height: 150)
            }
            
            
            
            // Sign Up
            HalfModalView(isShown: $showSignUpWindow, bgColor: .black, bgOpacityLevel: 1.0, dismissableBackground: true,  modalHeight : 600 ) {
                SignUpWindowView(email: $email, password: $password, confirmedPassword: $confirmedPassword, showSignUpWindow: $showSignUpWindow)

            }
            
            
            // Sign Up
            HalfModalView(isShown: $showSignInWindow,  bgColor : .black, bgOpacityLevel: 1.0, dismissableBackground: true, modalHeight : 600) {
                SignInWindowView(showSignInWindow: $showSignInWindow, email: $email, password: $password)
            }
            
        }
        .navigationBarHidden(true)
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

