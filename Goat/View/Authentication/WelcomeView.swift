//
//  WelcomeView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/27/21.
//

import SwiftUI

struct WelcomeView: View {
    @State var showLogin = false
    @State var showStatesAndCountriesView = false
    
    @State var isOpenforStateAndCountries = false
    @State var lightBg = true
    
    @State var stateSearch = ""
    var body: some View {
        
        ZStack {
            Image("model-1")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 1000)
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
                            Button(action: {
                                isOpenforStateAndCountries.toggle()
                            }, label: {
                                Text("United States").underline()
                            })
                            
                               
                            
                            
                        }
                        .foregroundColor(.white)
                    }
                    .font(.system(size: 12))
                    
                    NavigationLink(destination: RegistrationView()) {
                        Text("Sign Up")

                        
                    }
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
            
            
            BottomSheetShopForView(isOpen: $isOpenforStateAndCountries, lightBg: $lightBg, stateSearch: $stateSearch)
            .offset(y: 100)
        }
        .navigationBarHidden(true)
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
