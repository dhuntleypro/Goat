//
//  YouMayAlsoLikeView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI



struct YouMayAlsoLikeView: View {

    
    
    var product : Product
    
    var body: some View {
        
        
        VStack {
            Text("Your May Also Like")
                .font(.system(size: 14, weight: .regular, design: .default))
            
            
            ProductCell02Loop()
            
            
            Button(action: {
                
            }) {
                Text("See More")
            }
            .modifier(ClearButtonStyleLarge(bgColor: .black))
            .padding(.vertical, 20)
            
        }
        
        
        
        
    }
}

//struct YouMayAlsoLike_Previews: PreviewProvider {
//    static var previews: some View {
//        YouMayAlsoLike(item: Product.example)
//    }
//}
