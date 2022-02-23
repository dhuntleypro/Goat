//
//  RelatedProductView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/28/21.
//

import SwiftUI
import Kingfisher

struct RelatedProductView: View {
    
    @ObservedObject private var collectionVM = CollectionViewModel()
    @ObservedObject var productVM = ProductViewModel()
    
    @State var condition = [String]()
    @State var conditiondata = ""
    @State var tagName = ""
    
    
    // Passed Collection values
    @Binding var id: String
    @Binding var title: String
    @Binding var caption: String
    @Binding var description: String
    @Binding var amount: String
    @Binding var likes: Int
    @Binding var onSale: Bool
    @Binding var images: [String]
    @Binding var sequenceCount: Int
    @Binding var conditions: [String]
    @Binding var active: Bool

    var body: some View {
        //
        VStack {
        HStack {
            Text("Related Products")
                .font(.system(size: 30, weight: .bold, design: .rounded))
            
            //   Spacer()
            
            
        }
        
        ForEach(productVM.products){ product in
            
            ForEach(product.tags,id:\.self){ tagName in
                //  if condition.count != 0 {
                ForEach(condition,id:\.self) { conditiondata in
                //    if conditiondata == tagName {
                        
                        //     Text("\(tagName)")
                        //     Text(tagName.count)
                        
                        HStack {
                            VStack {
                                ZStack{
                                    KFImage(URL(string: product.images[0]))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                        .clipped()
                                    
                                    
                                    
                                    Image(product.onAppImages[0])
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                        .clipped()
                                }
                            }
                            VStack(alignment: .leading){
                                
                                Text(product.name)
                                    .font(.subheadline)
                            }
                            .padding(.trailing)
                            
                            Spacer()
                        }
              //      }
                }
            }
        }
        }
    }
}

//struct RelatedProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        RelatedProductView(id: <#Binding<String>#>, title: <#Binding<String>#>, caption: <#Binding<String>#>, description: <#Binding<String>#>, amount: <#Binding<String>#>, likes: <#Binding<Int>#>, onSale: <#Binding<Bool>#>, images: <#Binding<[String]>#>, sequenceCount: <#Binding<Int>#>, conditions: <#Binding<[String]>#>, active: <#Binding<Bool>#>)
//    }
//}
