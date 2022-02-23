//
//  ShippingProductView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI

struct ShippingProductView: View {
    
    @State var showShipping = false
    @State var isShareSheetShowing = false
    
  //  @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Button(action: {
                self.showShipping.toggle()
            }) {
                Text("Shipping and Returns")
                    .underline()
                    .foregroundColor(.primary)
            }
            .sheet(isPresented: $showShipping) {
                ShippingSheetView()
            }
            
            
            .padding(20)
            
            HStack(spacing: 20) {
               
                
                Button(action: {
               //     presentation.wrappedValue.dismiss()
                        
                }) {
                    Text("Shop More")
                }
                .modifier(myClearButton100BY35(bgColor: .black))
                
                
                NavigationLink(destination: Text("EcommerceStyleView()")
                
                ) {
                    Text("Style")
                }
                .modifier(myClearButton100BY35(bgColor: .black))

                
                Button(action: {
                   shareButton()
                        
                }) {
                    Text("Share")
                }
                .modifier(myClearButton100BY35(bgColor: .black))

            }
            .padding(.bottom, 20)
            
        }
    }
    func shareButton() {
        isShareSheetShowing.toggle()
        
        let url = URL(string: BRAND_URL)
        let av = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController?
            .present(av, animated: true, completion: nil)
    }
}

//struct ShippingProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShippingProductView()
//    }
//}
