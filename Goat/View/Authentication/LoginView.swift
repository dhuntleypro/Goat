//
//  LoginView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/27/21.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var email = ""
    @State var password = ""
    
    @State var adminLoggedIn = false
    
    var body: some View {
            ZStack {

                Color(.gray).edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
                    HStack(alignment: .center) {
                        
                        
                        Spacer()
                        Text("Login")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .bold()
                            .padding(.leading)
                        
                        Spacer()
                        
                        Button(action: {

                            presentationMode.wrappedValue.dismiss()

                        }, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 20))

                        })
                        
                    }
                    .padding(.vertical)
                    
                    VStack(alignment: .leading) {
                    Text("EMAIL OR USERNAME ")
                        .font(.system(size: 10))
                        .foregroundColor(.black)
                        .bold()
                        .padding(.vertical, 7)
                    
                    
                 
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope", lightBg: true)
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                        Text("PASSWORD")
                            .font(.system(size: 10))
                            .foregroundColor(.black)
                            .bold()
                            .padding(.vertical, 7)
                        
                        CustomSecureField(text: $password, placeholder: Text("Password"), lightBg: true)
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                        HStack {
                            Spacer()
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Forgot Password?")
                                    .font(.footnote)
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.top)
                                
                            })
                        }
                        
                        Button(action: {
                            viewModel.login(withEmail: email, password: password)
                            guard let uid = viewModel.userSession?.uid else { return }
                            
                            if uid == "Nef9mwaHviaFG7WfrYnLdQEVO5u2" {
                                self.adminLoggedIn = true
                            } else {
                                
                            }
                            
                            
                        }, label: {
                            Text("Sign In")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(width: 300, height: 50)
                                .background(Color.white)
                                .clipShape(Capsule())
                                .padding()
                        })
                        
                    }
                    Spacer()
                    
                    NavigationLink(destination: RegistrationView().navigationBarBackButtonHidden(true)) {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign Up")
                                .font(.system(size: 13 , weight: .semibold))
                            
                        }
                        .foregroundColor(.white)
                       // .padding(.top,20)
                    }
                    
                }
                .padding()
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)

            
        
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        LoginView()
        
    }
}
