//
//  UserPaymentView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/6/21.
//

import SwiftUI

struct UserPaymentView: View {
    @State var showPaypal = false
    @State var showInstructions = false
    @State var payPalKey = ""
    
    @State var showPaypalSandBoxAccount = false
    
    // add under user - Demo info
    @State var paypalSandBoxAccount  = "sb-98drr6131965@business.example.com"
    @State var paypalClientID  = "ARUG3mpFEJGH7S2xA_bPttEWhdb4CTvAiQbTespHNSzho6FsoIFX_g6Y-XfOjIfxoyhEmlcfzx-K8TP3"
    @State var paypalSecret  = "ECew2xQm6zNvAxWYIbBXqLOUkLANXxsBcInvBBt_VSB_hdzl8MgL1Yao08404on9FpYaekMT7e_Fwy9t"

    @State var brainTreeTokenizationKeys = "sandbox_q7yjdhz5_rztzm3c894v4vjjg"
    
    
    var body: some View {
        List {
            VStack {
                Button(action: {
                    showPaypal.toggle()
                }) {
                    VStack(alignment: .leading) {
                        
                        Text("Paypal")
                        
                        Text("Account user will be sending money to")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                }
                .fullScreenCover(isPresented: $showPaypal) {
                    VStack {
                        HStack {
                            Image("PaypalLogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                            
                            
                            Spacer()
                            HStack {
                                Button(action: {
                                    
                                }) {
                                   Text("Update")
                                    .padding()
                                    .background(Color.black)
                                    .cornerRadius(15)
                                    .foregroundColor(.white)
                                    .font(.system(size: 12))
                                }
                              
                                
                                
                                Button(action: {
                                    self.showInstructions.toggle()
                                }) {
                                    Image(systemName: "info.circle.fill")
                                        .foregroundColor(.black)
                                        .font(.system(size: 25))
                                }
                                .sheet(isPresented: $showInstructions) {
                                    PaypalInstructionView()
                                }
                            }
                           
                        }
                        .padding()
                        
                        VStack(alignment: .leading , spacing: 2) {
                            
                            VStack(alignment: .leading) {
                                // Paypal
                                 Text("Paypal")
                                     .font(.system(size: 25, weight: .bold, design: .rounded))
                                 
                                
                                VStack(alignment: .leading){
                                    Text("SandBox Account")
                                        .bold()
                                    CustomTextField(text: $paypalSandBoxAccount, placeholder: Text("SandBox Account") , imageName: "app")
                                }
                                .padding()
                                .background(Color(.gray).opacity(0.7))
                                .cornerRadius(10)
                                .foregroundColor(.black)
                                .font(.system(size: 13))
                                .frame(width: 350)
                                
                                VStack(alignment: .leading){
                                    Text("Paypal Client ID")
                                        .bold()
                                    CustomTextField(text: $paypalClientID, placeholder: Text("Paypal Client ID") , imageName: "app")
                                }
                                .padding()
                                .background(Color(.gray).opacity(0.7))
                                .cornerRadius(10)
                                .foregroundColor(.black)
                                .font(.system(size: 13))
                                .frame(width: 350)
                                
                              
                                
                                VStack(alignment: .leading){
                                    Text("Paypal Secret")
                                        .bold()
                                    CustomTextField(text: $paypalSecret, placeholder: Text("Paypal Secret") , imageName: "app")
                                }
                                .padding()
                                .background(Color(.gray).opacity(0.7))
                                .cornerRadius(10)
                                .foregroundColor(.black)
                                .font(.system(size: 13))
                                .frame(width: 350)
                                
                                
                                
                               // Braintree
                                Text("Braintree")
                                    .font(.system(size: 25, weight: .bold, design: .rounded))
                                    .padding(.top)
                                
                                VStack(alignment: .leading){
                                    Text("Paypal Secret")
                                        .bold()
                                    CustomTextField(text: $brainTreeTokenizationKeys, placeholder: Text("BrainTree Tokenization Keys") , imageName: "app")
                                }
                                .padding()
                                .background(Color(.gray).opacity(0.7))
                                .cornerRadius(10)
                                .foregroundColor(.black)
                                .font(.system(size: 13))
                                .frame(width: 350)
                           
                            }
                        }
                        .padding()
                        
                        Spacer()
                    }
                    .padding()
                }
            }
            
            
            Spacer()
        }
    }
}

struct UserPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        UserPaymentView()
    }
}
