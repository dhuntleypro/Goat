//
//  TitleAndDismissView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI

struct TitleAndDismissView: View {
    
    // must pass _presentationMode in order for dismiss to work
    //   @Environment(\.presentationMode) var presentationModeProduct
   // @Environment(\.presentationMode) var presentationModeCollection


    var title : String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .bold()
                .padding(.leading)
            Spacer()
            Button(action: {
           //     presentationModeProduct.wrappedValue.dismiss()

             //   presentationModeCollection.wrappedValue.dismiss()

            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.trailing)
            }
        }
        .padding(.horizontal)
        .padding(.top, 20)
        .padding(.vertical)
        
    }
}

struct TitleAndDismissView_Previews: PreviewProvider {
    static var previews: some View {
        TitleAndDismissView(title: "Create Product")
    }
}
