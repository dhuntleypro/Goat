//
//  SubscriptionTiersRow.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/22/21.
//

import SwiftUI

struct SubscriptionTiersRow: View {
    
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
