//
//  CollectionCell01.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI
import Kingfisher

struct CollectionCell01: View {
    
    var collection : Collection
    var body: some View {
        HStack {
            ZStack(alignment: .bottomLeading) {
                Color(.blue).frame(width: 275, height: 130)
                
                
                VStack {
                    HStack {
                       
                        ZStack {
                            
                            KFImage(URL(string: collection.images[0]))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 125, height: 125)
                                .cornerRadius(10)
                                .clipped()
                            
                            Image(collection.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 125, height: 125)
                                .cornerRadius(10)
                                .clipped()
                            
                        }
                        .padding(.bottom)
                        
                        HStack {
                            Spacer()
                            
                            Text(collection.title)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                        }
                        
                    }
                    
                   
                  
                  
                    
                }
                .padding()
                
            }
            .cornerRadius(15.0)
            
        }
        .frame(width: 275, height: 150)
    }
}

struct CollectionCell01_Previews: PreviewProvider {
    static var previews: some View {
        CollectionCell01(collection: Collection(dictionary: ["String" : "Any"]))
    }
}
