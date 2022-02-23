//
//  OnboardingPage2View.swift
//  OurStore
//
//  Created by Darrien Huntley on 3/2/21.
//



import SwiftUI
import Kingfisher

struct OnboardingPage2View: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var appeared: Double = 0.0
    @State var getStarted = false
    
    
    var body: some View {
        ZStack {
            //  Color(#colorLiteral(red: 0.9179252982, green: 0.9180791974, blue: 0.9179050326, alpha: 1))
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
                
                
                
                Text("We can help!")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 50)
                    .padding()
                    .padding(.top, 50)
                    .foregroundColor(.black)

                
                Text("Want an online store? Apps for the nation is a place you can build your own store to sell or provide any service for your business")
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
                    
                    NavigationLink(destination: OnboardingPage3View()) {
                        Image(systemName: "chevron.right.circle.fill")
                            .font(.system(size: 36, weight: .regular))
                            .foregroundColor(.black)
                            .padding()
                    }
                    
                }
                .padding()
              
                
            }
        }
        .navigationBarHidden(true)
    }
}

struct OnboardingPage2View_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage2View()
    }
}

