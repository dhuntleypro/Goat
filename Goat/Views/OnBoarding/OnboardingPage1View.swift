//
//  OnboardingPageView.swift
//  OurStore
//
//  Created by Darrien Huntley on 3/2/21.
//

import SwiftUI
import Kingfisher

struct OnboardingPage1View: View {
    
   // @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var getStarted = false
    
    @State var showSignInWindow : Bool = false
    
    @State var password = ""
    @State var email = ""
    
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: 20) {
                Spacer()
                
                //                LottieView(filename: "marketing")
                //                    .frame(width: 300, height: 300)
                //
                
     
                    Image("phones")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                
                
                Text("Want an App?😏")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 50)
                    .padding()
                    .padding(.top, 50)
                    .foregroundColor(.black)
                
                Text("Want an online store? Apps for the nation is a place you can have your own store to sell or provide any service for your business")
                    .font(.system(size: 16, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 50)
                    .foregroundColor(.gray)
                
                
                Spacer()
                
        
                NavigationLink(destination: OnboardingPage2View()) {
                    Text("Get Started")
                        .modifier(myFillButton300BY45(bgColor: .black))
                }
               
                
                
                Button(action: {
                    
                    showSignInWindow.toggle()
                    // GO BACK
                 //  presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Already Have an Account ?")
                        .foregroundColor(.black)
                        .underline()
                    
                }
                
                
                Spacer()
                
                
            }
            
              // Sign Up
            HalfModalView(isShown: $showSignInWindow,  bgColor : .black, bgOpacityLevel: 1.0, dismissableBackground: true, modalHeight : 600) {
                SignInWindowView(showSignInWindow: $showSignInWindow, email: $email, password: $password)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct OnboardingPage1View_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage1View()
    }
}

