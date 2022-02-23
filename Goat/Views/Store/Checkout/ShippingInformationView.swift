//
//  ShippingInformationView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/6/21.
//


import SwiftUI

struct ShippingInformationView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @ObservedObject var cartVM = CartViewModel()
    
    
    @Binding var shipTo : Bool
    @Binding var inPersonPurchase : Bool
    
    @Binding var shippingCost : Float
    
    @State var openShippingSheet = false
    
    
    func getPrice(value: Float)-> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        
        return format.string(from: NSNumber(value: value)) ?? ""
    }
    
    @Binding var address: String
    @Binding var city : String
    @Binding var state: String
    @Binding var zip: String
    
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    shipTo.toggle()
                    inPersonPurchase.toggle()
                }, label: {
                    Image(systemName: shipTo ? "record.circle" : "circle" )
                    
                })
                
                Text("Ship to")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                
                Spacer()
                
                Button(action: {
                    self.openShippingSheet.toggle()
                }) {
                    Text("Ship to...")
                        .font(.system(size: 14))
                }
                .sheet(isPresented: $openShippingSheet, onDismiss: cartVM.fetchUserCart) { // look to update
                    ZStack {
                        
                        Color(.black)
                            .opacity(0.98)
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack(alignment: .leading , spacing : 20) {
                            
                            HStack {
                                
                                Text("Shipping Information")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 25, weight: .bold, design: .rounded))
                                
                                Spacer()
                                
                                Button(action: {
                                    viewModel.updateAddress(address: address, state: state, city: city, zip: zip)
                                }) {
                                    Text("Done")
                                        .foregroundColor(Color.white)
                                }
                                .padding(.vertical)
                                
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Address")
                                CustomTextField(text: $address, placeholder: Text("Address") , imageName: "pencil.circle")
                                    .padding()
                                    .background(Color(.init(white: 1, alpha: 0.15)))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("City")
                                CustomTextField(text: $city, placeholder: Text("City") , imageName: "pencil.circle")
                                    .padding()
                                    .background(Color(.init(white: 1, alpha: 0.15)))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("State")
                                CustomTextField(text: $state, placeholder: Text("State") , imageName: "pencil.circle")
                                    .padding()
                                    .background(Color(.init(white: 1, alpha: 0.15)))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Zip")
                                CustomTextField(text: $zip, placeholder: Text("Zip") , imageName: "pencil.circle")
                                    .padding()
                                    .background(Color(.init(white: 1, alpha: 0.15)))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                                viewModel.updateAddress( address: address, state: state, city: city, zip: zip )
                                
                            }) {
                                Text("Confirm")
                            }
                        }
                        .padding()
                        .foregroundColor(Color.white)
                        
                    }
                }
            }
            .padding()
            .foregroundColor(.black)
            
            
            TwoRowButton(textOne: "Standard: $12)", textTwo: "The item will be shipped within 24 hours")
            
            HStack {
                Text("*Estimates valid for orders shipping to contiguous US state only.")
                    .foregroundColor(.black)
                    .font(.system(size: 8))
                    .padding()
                
                Spacer()
                
            }
            
            HStack {
                Button(action: {
                    shipTo.toggle()
                    inPersonPurchase.toggle()
                }, label: {
                    Image(systemName: shipTo ? "circle" : "record.circle")
                    
                })
                
                Text("Pay now")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                
                Spacer()
                
                Text("In Person")
                    .font(.system(size: 14))
                
            }
            .padding()
            .foregroundColor(.black)
            
            Divider()
        }
    }
}

//struct ShippingInformationView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShippingInformationView(shipTo: .constant(false), inPersonPurchase: .constant(false), shippingCost: .constant(0))
//    }
//}
