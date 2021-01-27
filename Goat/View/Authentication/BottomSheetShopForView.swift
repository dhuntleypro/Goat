//
//  ShopFromView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/27/21.
//

import SwiftUI

struct BottomSheetShopForView: View {
    
    @Binding var isOpen : Bool
    @Binding var lightBg : Bool
    
    @Binding var stateSearch : String
    var body: some View {
        BottomSheetView(isOpen: $isOpen, lightBg: $lightBg, maxHeight: 750) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Where are you shopping?")
                    .font(.system(size: 30))
                    .padding(.trailing)
                
                Text("Choose your location for accurate shipping rates, taxes and duties")
                    .font(.caption)
                    .padding(.trailing, 50 )
                
                HStack {
                    SearchBar(text: $stateSearch)
                    Spacer()
                    
                }
                
                ForEach(MOCK_STATES_AND_COUNTRIES) { stateC in
                    VStack {
                        HStack {
                            Image(systemName: "\(stateC.image)")
                            
                            Text(stateC.name)
                                .font(.system(size: 13))
                            
                            Spacer()
                            
                            Image(systemName: "checkmark.circle.fill").font(.system(size: 16, weight: .regular))
                            
                            
                        }
                        .padding(8)
                        
                        Divider()
                        
                    }
                }
            }
            .padding()
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct  BottomSheetShopForView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetShopForView(isOpen: .constant(true), lightBg: .constant(true), stateSearch: .constant(""))
    }
}
