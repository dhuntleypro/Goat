//
//  SignUpWindowView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct SignUpWindowView: View {
    @EnvironmentObject var viewModel: AuthViewModel
 //   @Environment(\.presentationMode) var presentationMode

    @Binding var email : String
    @Binding var password : String
    @Binding var confirmedPassword : String
    @Binding var showSignUpWindow : Bool
    
    
    var body: some View {
        VStack {
            HStack {
                
                Button(action: {
                    
                    showSignUpWindow.toggle()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    
                }
                Spacer()
                Text("Sign Up")
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
                
                CustomSecureField(text: $confirmedPassword, placeholder: Text("Confirmed Password"))
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                
            }
            .padding(.horizontal, 32)
            
            
            
            Button(action: {
                
                viewModel.registerNoPhoto(email: email,password: password)
                
            }, label: {
                Text("Sign Up")
            })
            .modifier(myFillButton200BY35(bgColor: .white, txtColor: .black))
            .padding()
            
            // URL LINK (fix)

            Text("By tapping sign up or continue with Apple, you agree to our Terms and Conditions and Privacy Policy")
                .foregroundColor(.gray)
                .padding(20)
                .font(.system(size: 10))
                .frame(width: 300)
           
            
            
            Spacer()
        }
        .foregroundColor(.white)
      //  .background(Color.red)
    }
}

struct SignUpWindowView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpWindowView(email: .constant("email"), password: .constant("password"), confirmedPassword: .constant("password 2"), showSignUpWindow: .constant(false))
        
    }
}
