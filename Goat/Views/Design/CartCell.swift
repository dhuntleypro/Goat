//
//  CartCell.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/3/21.
//

import SwiftUI
import Kingfisher

struct CartCell: View {
    
    // var cart : Cart
    
    @Binding var item : Cart
    @Binding var items : [Cart]
    @State var selectedSizePrice : Float = 0
 
    @State var isSwiped : Bool = false
    @State var offset : CGFloat = 0
    
    
    var body: some View {
        
        ZStack {
       //     LinearGradient(gradient: .init(colors: [Color.blue , Color.blue.opacity(0.1)]), startPoint: .leading, endPoint: .trailing)
            
            // Cuatom Delete Button
            HStack {
                Spacer()
                
                Button(action: {
                    withAnimation(.easeIn) { deleteItem()
                        
                    }
                }) {
                    Image(systemName: "trash")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 90, height: 50) // default frame
                    
                }
            }
            
            HStack(spacing: 15){
                ZStack {
                    
                    KFImage(URL(string: item.image))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 110, height: 110)
                        .cornerRadius(15)
                    
                    Image("\(item.demoImage[0])")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 110, height: 110)
                        .cornerRadius(15)
                    //  .clipped()
                    
                }
                
                VStack(alignment: .leading , spacing: 10) {
                    Text(item.name)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    HStack {
                        
                        //   Text("\((getPrice(value: item.cost)))")
                        Text(getPrice(value: (item.cost * Float(item.quantity))))
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Spacer(minLength: 0)
                        
                        // Add - Sub Button
                        Button(action: {
                            if item.quantity > 1{item.quantity -= 1}
                        }) {
                            Image(systemName: "minus")
                                .font(.system(size: 16, weight: .heavy))
                                .foregroundColor(.black)
                        }
                        
                        Text("quanity: \(item.quantity)")
                            .font(.system(size: 16))
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .background(Color.black.opacity(0.06))
                        
                        Button(action: {
                            item.quantity += 1
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 16, weight: .heavy))
                                .foregroundColor(.black)
                        }
                    }
                    Text("size : \(item.size)")
                }
            }
            .padding()
            .background(Color.gray.opacity(0.9))
            .contentShape(Rectangle())
            .offset(x: item.offset)
            .gesture(DragGesture().onChanged(onChange(value:)).onEnded(onEnded(value:)))
            
            
        }
    }
    
    func onChange(value: DragGesture.Value) {
       
        if value.translation.width < 0 {
            
            if item.isSwiped {
                item.offset = value.translation.width - 90

            } else {
                item.offset = value.translation.width
            }
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        
        withAnimation(.easeOut) {
            if value.translation.width < 0 {
                
                // Checking..
                
                if -value.translation.width > UIScreen.main.bounds.width / 2 {
                    item.offset = -1000
                    deleteItem()
                    
                } else if -item.offset > 50{
                    // update - is Swiped
                    item.isSwiped = true
                    item.offset = -90
                } else {
                    item.isSwiped = false
                    item.offset = 0
                }
            } else {
                item.isSwiped = false
                item.offset = 0
            }
        }
    }
    
    // remove item...
    func deleteItem() {
        items.removeAll { item -> Bool in
            // add remove from firebase....
            
            
            return self.item.id == item.id
            
        }
    }
    
    
    func getPrice(value: Float)-> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        
        return format.string(from: NSNumber(value: value)) ?? ""
    }
    
    
    
    //    func total () {
    //        var cost = item.cost
    //        var quantity = item.quantity
    //
    //        return total = cost * quantity
    //
    //    }
}

//struct CartCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CartCell()
//    }
//}
