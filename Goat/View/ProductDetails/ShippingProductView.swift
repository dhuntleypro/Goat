//
//  ShippingProductView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct ShippingProductView: View {
    
    @State var showShipping = false
    @State var isShareSheetShowing = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                    presentationMode.wrappedValue.dismiss()
                        
                }) {
                    Text("Shop More")
                }
                .modifier(ClearButtonEven(bgColor: .black))
                
                
                NavigationLink(destination: StyleView()) {
                    Text("Style")
                }
                .modifier(ClearButtonEven(bgColor: .black))
                
                
                Button(action: {
                   shareButton()
                        
                }) {
                    Text("Share")
                }
                .modifier(ClearButtonEven(bgColor: .black))

            }
            .padding(.bottom, 20)
            
        }
    }
    func shareButton() {
        isShareSheetShowing.toggle()
        
        let url = URL(string: "https://apple.com")
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
