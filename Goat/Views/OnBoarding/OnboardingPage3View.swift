//
//  OnboardingPage3View.swift
//  OurStore
//
//  Created by Darrien Huntley on 3/2/21.
//

import SwiftUI
import Kingfisher

struct OnboardingPage3View: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var subscriptionVM = SubscriptionViewModel()
    
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: 20) {
                
                Spacer()
                
                
                Text("Create before you buy!")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 70)
                    .padding()
                    .padding(.top, 50)
                
                Text("We want you to have the best exercises without worrying about as time frame. When your ready to go live, we're ready to")
                    .font(.system(size: 16, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 50)
                    .foregroundColor(.gray)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                
                        Image(systemName: "chevron.left.circle.fill")
                            .font(.system(size: 36, weight: .regular))
                            .foregroundColor(.black)
                            .padding()
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: DashboardView()) {
                        Text("Done")
                            .modifier(myFillButton100BY35(bgColor: .black, txtColor: .white))
                    }
                    
                    
                }
                .padding()
            }
            .foregroundColor(.black)

        }
        .navigationBarHidden(true)
    }
}

struct OnboardingPage3View_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage3View()
    }
}


