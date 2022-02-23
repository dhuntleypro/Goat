//
//  SizeSliderView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct SizeSliderView: View {
    
  //  @State var sizes : [String] = [""]
    @State var sizePrices: [String] = [""]
    
    let sizes = ["XS" , "S" , "M" , "L" , "XL" , "2XL" , "3XL" , "4XL"]

    let sizeAndPricing = [
        "XS": "300",
        "S" : "300",
        "M" : "300",
        "L": "300",
        "XL" : "300",
        "2XL" : "300"
    ]
    
    var body: some View {
        VStack {
            ForEach(0..<sizes.count, id: \.self ) { size in
                Button(action: {}) {
                    Text(sizes[size])
                        .foregroundColor(.white)
                }
               
            }
            
          
        }
    }
}

struct SizeSliderView_Previews: PreviewProvider {
    static var previews: some View {
        SizeSliderView()
    }
}
