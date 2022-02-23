//
//  SignInWindowView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct SignInWindowView: View {
    @EnvironmentObject var viewModel: AuthViewModel
   
    @Binding var showSignInWindow : Bool
    @Binding var email : String
    @Binding var password : String

    
    var body: some View {
        VStack {
            HStack {
                
                Button(action: {
                    showSignInWindow.toggle()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    
                }
                Spacer()
                Text("Sign In")
                    .font(.title2)
                    .bold()
                    
                
                Spacer()
                
            }
            .padding()
            
            
            SignInWithAppleView()
                .frame(width: 200, height: 50)
            
            
            Text("---- or sign up with email ----")
            
            
            VStack(spacing: 8) {
                
                CustomTextField(text: $email, placeholder: Text("Email") , imageName: "envelope")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                
                CustomSecureField(text: $password, placeholder: Text("Password"))
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                
              
            }
            .padding(.horizontal, 32)
            
            
            
            Button(action: {
                viewModel.login(withEmail: email, password: password)

            }, label: {
                Text("Sign In")
            })
            .modifier(myFillButton200BY35(bgColor: .white, txtColor: .black))
            .padding()
            
            // URL LINK (fix)

            Text("Forgot Password?")
                .font(.title2)
                .foregroundColor(.gray)
                .padding(20)
                .font(.system(size: 10))
              
           
            
            
            Spacer()
        }
        .foregroundColor(.white)
      //  .background(Color.red)
    }
}

struct SignInWindowView_Previews: PreviewProvider {
    static var previews: some View {
        SignInWindowView(showSignInWindow : .constant(false), email: .constant("email"), password: .constant("password"))
    }
}
