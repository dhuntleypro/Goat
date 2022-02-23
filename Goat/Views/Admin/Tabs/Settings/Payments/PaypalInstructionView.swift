//
//  PaypalInstructionView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/6/21.
//

import SwiftUI

struct PaypalInstructionView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading , spacing: 25) {
                Group {
                Text("Linking your paypal account to your app is fearly easy")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                
                Text("1. You need to first sign in and create an app on paypal using the link below")
                    .bold()

                Link("Sign in", destination: URL(string: "https://www.paypal.com/signin?intent=developer&returnUri=https%3A%2F%2Fdeveloper.paypal.com%2Fdeveloper%2Fapplications")!)
                
                Text("2. Then create a sandox account with the link below")
                    .bold()
                
                Link("Create Paypal Sandbox", destination: URL(string: "https://developer.paypal.com/developer/accounts/")!)
                
                Text("3. Create Account | Business Merchanet Account ")
                }
                
                Group {
                    Text("4.  Click 3 dots to the right of new account - Edit ")
                    Text("Here list the info we need under API Cre. ")
                    
                    
                    Text("5. Then we need to create app by wither goin to my accounts  to the right or clicking the link below")
                        .bold()
                    
                    Link("My apps & credentials", destination: URL(string: "https://developer.paypal.com/developer/applications")!)
                    
                    
                    Text("6. Create Account | Business Merchanet Account ")
                    
                    Text("7.Need to connect to brain tree ")
                    
                    Link("Braintree", destination: URL(string: "https://sandbox.braintreegateway.com/merchants/rztzm3c894v4vjjg/users/8jbh4tr4ngfv5gxy/api_keys")!)
                }
                
                Group {
                    Text("8. Click gear/setting | API")
                    
                    Text("9. Generate Tokenization Keys")
                    
                    Text("10. Click Proccessing at the top")
                    
                    Text("10. under paypal should show an on/off button with link sandbox or options (click it)")
                    
                    Text("11. paste in all repected paypal info Paypal email (the generated on | client id | secret)")
                    
                }
               
                
            }
            .padding()
        }
    }
}

struct PaypalInstructionView_Previews: PreviewProvider {
    static var previews: some View {
        PaypalInstructionView()
    }
}
