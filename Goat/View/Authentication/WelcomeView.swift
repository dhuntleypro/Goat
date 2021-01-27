//
//  WelcomeView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/27/21.
//

import SwiftUI

struct WelcomeView: View {
    @State var showLogin = false
    var body: some View {
        NavigationView{
        ZStack {
            Image("model-1")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 900)
                .overlay(Color(.black).opacity(0.5))
            VStack {
                Spacer()
                Text("PAST PRESENT FUTURE")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                Spacer()
             

                VStack {
                    HStack {
                        Image(systemName: "flag")
                        
                        HStack(spacing: 0) {
                            Text("Shopping from ")
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("United States").underline()
                            })
                        }
                        .foregroundColor(.white)
                    }
                    .font(.system(size: 12))
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Sign Up").bold()
                    })
                    .modifier(ClearButtonStyleLarge(bgColor: .white))
                    .padding()
                    
                    
                    HStack {
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Log In").underline()

                        }
                        Text("or")
                        
                        NavigationLink( destination: ContentView()) {
                            Text("Start Browsing").underline()
                        }
                      
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 80)
                    .font(.system(size: 13))

                }
            }
        }
        .navigationBarHidden(true)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
