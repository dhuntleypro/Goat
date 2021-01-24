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
            
            
            LazyVGrid(columns: columns) {
                ForEach(MOCK_PRODUCTS) { product in
                    
                    // Link to Details view
                    
                    HStack(spacing: 0) {
                        ForEach(MOCK_PRODUCTS){ items in
                            
                            NavigationLink(destination: ProductDetailsView(product: product)) {
                               // TwoColumeItemRow(product: product)
                            }
                        }
                    }
                }
                
                Spacer(minLength: -10)
            }
            
            
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
