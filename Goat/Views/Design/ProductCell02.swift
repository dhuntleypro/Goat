//
//  ProductCell02.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI
import Firebase
import Kingfisher

struct ProductCell02: View {
    //  @State private var imageURL = URL(string: "")
    
    @State var need = false
    @State var want : Bool = false
    
    
    var product: Product
    
    var body: some View {
        
        
        VStack {
            HStack(alignment: .center) {
                Text(product.detailedTimestampString)
                    .font(.system(size: 12, weight: .regular, design: .default))
                    .foregroundColor(.black)
                Spacer()
                
                Button(action: {
                    want.toggle()
                }) {
                    Text("Want")
                }
                .modifier(want ?  myClearButton60BY35(textColor: .white, bgColor: .black ) : myClearButton60BY35(textColor: .black, bgColor: .white))
                
                
//                NavigationLink(destination: WantView()) {
//                    Text(product.want ? "Added" : "Want")
//                        .foregroundColor(.black)
//                        .modifier(product.want ? myClearButton60BY35(bgColor: .black) : myClearButton60BY35(bgColor: .gray))
//
//                }
            }
            .padding(25)
            .frame(height: 60)
            
            ZStack {
                Image(product.onAppImages[0])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 130 , height:100)
                
                KFImage(URL(string: product.images[0]))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 130 , height: 100 )
                
            }
            
            
            Text(product.name)
                .foregroundColor(.black)
                .font(.system(size: 12, weight: .regular, design: .default))
                .multilineTextAlignment(.center)
                .frame(height: 60)
                .padding()
            
            if product.sizePricing.count > 1 { // non variant
                
                if product.sizePricing[0] != 0 {
                //    Text("$\(product.sizePricing[0])") // non variant
                    Text(getPrice(value: product.sizePricing[0]))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(width: 170)
                        .foregroundColor(.black)
                        .padding(.bottom, 30)
                    
                    
                } else if product.sizePricing[0] == 0 {
                     Text(getPrice(value: product.sizePricing[1]))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(width: 170)
                        .foregroundColor(.black)
                        .padding(.bottom, 30)
                    
                } else if product.sizePricing[1] == 0 {
                    Text(getPrice(value: product.sizePricing[2]))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(width: 170)
                        .foregroundColor(.black)
                        .padding(.bottom, 30)
                    
                } else if product.sizePricing[2] == 0 {
                    Text(getPrice(value: product.sizePricing[3]))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(width: 170)
                        .foregroundColor(.black)
                        .padding(.bottom, 30)
                    
                } else if product.sizePricing[3] == 0 {
                    Text(getPrice(value: product.sizePricing[4]))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(width: 170)
                        .foregroundColor(.black)
                        .padding(.bottom, 30)
                    
                } else if product.sizePricing[4] == 0 {
                  //  Text("$\(product.sizePricing[5])") // non variant
                    Text(getPrice(value: product.sizePricing[5]))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(width: 170)
                        .foregroundColor(.black)
                        .padding(.bottom, 30)
                    
                }  else if product.sizePricing[5] == 0 {
                    Text("Size Limited") // non variant
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(width: 170)
                        .foregroundColor(.black)
                        .padding(.bottom, 30)
                    
                }
                
            } else {

                Text(getPrice(value: product.cost))
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .frame(width: 170)
                    .foregroundColor(.black)
                    .padding(.bottom, 30)
                
            }
        }
        .background(Color.white)
        .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
    }
    func getPrice(value: Float)-> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        
        return format.string(from: NSNumber(value: value)) ?? ""
    }
}



//struct ProductCell02_Previews: PreviewProvider {
//    static var previews: some View {
//        HStack{
//        ProductCell02(product: Product(id: 0, name: "String", description: "String", image: "602213_01", price: 330, tags: ["String"], isCurrentUser: true))
//
//        }
//    }
//}
//
