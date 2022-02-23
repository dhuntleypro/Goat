//
//  SubscriptionCell.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/21/21.
//

import SwiftUI

struct SubscriptionCell: View {
    let subscriptionTier : SubscriptionTier
    let action : () -> Void
    
    var subscription : SubscriptionType
    
    var yearDiscount = 20.01
    
    
    func getPrice(value: Float)-> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        
        return format.string(from: NSNumber(value: value)) ?? ""
    }
    
    var body: some View {
        
        VStack(alignment: .leading ) {
            
            // fix (remove zstack and add image to data)
            ZStack {
                Image(subscription.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height:300)
                    .clipShape(Rectangle())
                    .cornerRadius(10.0)

            }
        
         
         Text(subscription.name)
             .foregroundColor(.white)
             .font(.system(size: 24, weight: .bold, design: .rounded))
         
         Text(subscription.subscriptionType)
             .foregroundColor(.gray)
             .font(.system(size: 17, weight: .semibold, design: .rounded))
         
         Text("Version: 1.02")
             .foregroundColor(.gray)
             .font(.system(size: 17, weight: .semibold, design: .rounded))
         
         HStack {
             Text("$\(subscription.price.clean)")
                .foregroundColor(Color.teal)
                .bold()
             
             Text("| per Month")
                 .foregroundColor(.gray)
            
            HStack {
             Text("or")
                .foregroundColor(.gray)
               
                Text("$\((subscription.yearPrice.cleanCurrency))")
                .foregroundColor(Color.teal)

             Text("| per Year")
                .foregroundColor(.gray)
            }
            
            
         }
         .padding(.bottom)
         .font(.system(size: 17, weight: .semibold, design: .rounded))
            
            HStack(spacing: 15) {
                Button(action: {
                    
                }) {
                    Text("Test App")
                        .modifier(myButtonStyleSmall(prime: .black, myBackground: .white))
                }
                
                
                Button(action: {
                    
                }) {
                    Text("Subcribe")
                        .modifier(myButtonStyleSmall(prime: .black, myBackground: .teal))
                }
                
            }
            
            
            Text("Features")
                .underline()
                .foregroundColor(.white)
                .bold()
                .padding(.vertical)
            
           
            ForEach(subscription.features , id: \.self) { feature in
                Text("- \(feature.capitalized(with: .current))")
                    .foregroundColor(.teal)
                    .padding(.bottom, 3)
                
                
            }
        }
            
            HStack {
//                Button(action: {

//                    self.showDemoApplication.toggle()

//                    // login if no user
//                  //  demoButtonClicked.toggle()
//                    if auth.user?.isCurrentUser != nil  {
//
//                       print("yoo")
//                    } else if auth.user?.isCurrentUser == nil  {
//
//                        self.showDemoApplication.toggle()
//                    }
//
//                    // self.showDemoApplication.toggle()
//                }) {
//                    Text("Test App")
//                        .modifier(myButtonStyleSmall(prime: .black, myBackground: .white))
//                }
//                .sheet(isPresented: $showDemoApplication) {
//
//                    //   if auth.user?.isCurrentUser != nil {  // FUser.currentUser()!.onBoarding {
//                    if auth.userSession != nil {
//                        EcomTabView(editMode: $editMode, showCustomizeWindow: $showCustomizeWindow, storeId: DEMO_ID, storeLogo: storeLogo, showDemoApp: true)
//
//               //     } else if auth.user?.isCurrentUser == nil {
//                    } else  if auth.userSession == nil {
//
//                        LoginOrRegisterView(showLoginScreen: false)
//                    }
//                }



//                if auth.userSession != nil && auth.user?.basicStoreOwnerAccess  == true {
//                    NavigationLink(destination: StorePropertiesView()       .navigationBarBackButtonHidden(true)
//){
//                        Text("Create App")
//                            .modifier(myButtonStyleSmall(prime: .black, myBackground: Color("teal")))
//                    }
//                } else if auth.user?.basicStoreOwnerAccess  == false {
//                    NavigationLink(destination: AddNewStoreView()){
//                        Text("Create App")
//                            .modifier(myButtonStyleSmall(prime: .black, myBackground: Color("teal")))
//                    }
                  //      LoginOrRegisterView(showLoginScreen: false)

//                } else {
//                    VStack {
//                        Text("NOT WORKING")
//                            .foregroundColor(.white)
//                    }
//
//                }

//                    if auth.user?.isCurrentUser == nil  {
//
//                        LoginOrRegisterView(userAccessGranted: $userAccessGranted, demoButtonClicked: $demoButtonClicked, buildButtonClicked: $buildButtonClicked)
//                    } else if auth.user?.isCurrentUser != nil && auth.user?.basicStoreOwnerAccess == true {
//                    if auth.user?.isCurrentUser != nil  {
//                        EcomTabView(editMode: $editMode, showCustomizeWindow: $showCustomizeWindow, storeId: DEMO_ID, storeLogo: storeLogo, showDemoApp: true)
//                    } else if auth.user?.isCurrentUser == nil  {
//                        LoginOrRegisterView(userAccessGranted: $userAccessGranted, demoButtonClicked: $demoButtonClicked, buildButtonClicked: $buildButtonClicked)
//                    }
//                }
//


        }
        
    }

}

//struct SubscriptionCell_Previews: PreviewProvider {
//    static var previews: some View {
//        SubscriptionCell(subscription: SubscriptionType(dictionary: ["String" : "Any"]))
//    }
//}




import SwiftUI

struct SubscriptionTiersRow2: View {
    
    let subscriptionTier : SubscriptionTier
    let action : () -> Void
    
    var body: some View {
        
        HStack {
            
            ZStack {
                Image(subscriptionTier.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .cornerRadius(9)
                    .opacity(subscriptionTier.isLocked ? 3.0 : 0)
                    .blur(radius: subscriptionTier.isLocked ? 3.0 : 0)
                    .padding()
                
                Image(systemName: "lock.fill")
                    .font(.largeTitle)
                    .opacity(subscriptionTier.isLocked ? 1 : 0)
            }
            
            
            VStack(alignment: .leading) {
                Text(subscriptionTier.title)
                    .font(.title)
                
                Text(subscriptionTier.description)
                    .font(.caption)
            }
            
            
            Spacer()
            
            if let price = subscriptionTier.price, subscriptionTier.isLocked {
                Button(action: action) {
                    Text(price)
                        .modifier(myClearButton100BY35(bgColor: .black))
                }
            }
            
        }
        
        
    }
}

//struct SubscriptionTiersRow_Previews: PreviewProvider {
//    static var previews: some View {
//        SubscriptionTiersRow()
//    }
//}
