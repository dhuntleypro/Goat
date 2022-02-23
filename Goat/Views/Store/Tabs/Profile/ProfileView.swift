//
//  ProfileView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var auth: AuthViewModel
    // @State var showDashboard = true
    
    @State var storeName : String = ""
    @State var username : String = ""
    @State var fullname : String = ""
    
    var body: some View {
        
        VStack {
            if ((auth.user?.isCurrentUser) != nil){
                
                VStack {
                    ZStack {
                        Color(.gray).opacity(0.4)
                        
                        
                        VStack(spacing: 20) {
                            Image("defaultProfileImage")
                                .resizable()
                             //   .padding(12)
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())

                            Text("username")

                            HStack {
                                Button(action: {}) {
                                    Text("Profile Info")
                                        .modifier(myFillButton100BY35(bgColor: .black, txtColor: .white))
                                }
                                
                                Button(action: {
                                    auth.signOut()
                                }) {
                                    Text("Sign out")
                                        .modifier(myFillButton100BY35(bgColor: .black, txtColor: .white))
                                }
                                
                            }
                        }
                    }
                    .frame(width: 300, height: 200)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    
                    
                    
                    NavigationLink(destination: //UserAccountView()
                    Text("dddd")
                    ) {
                        Text("Account")
                            .padding()
                            .frame(width: 300 )
                            .background(Color(.black))
                            .foregroundColor(.white)
                    
                    }
                    
                    
                   Spacer()
                }
            }
                
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


