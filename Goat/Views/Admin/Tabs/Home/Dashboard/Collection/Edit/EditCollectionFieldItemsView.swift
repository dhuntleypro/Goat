//
//  EditCollectionFieldItemsView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/9/21.
//


import SwiftUI

struct EditCollectionFieldItemsView: View {
    
    
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
    
    @Binding var showCondition : Bool
    
    
    
    var body: some View {
        ScrollView(.vertical) {
            VStack{
                
                HStack {
                    Button(action: {
                        self.active.toggle()
                    }) {
                        Text(active ? "Active" : "Not Active")
                            .modifier(active ? myClearButton100BY35(bgColor: .black) :  myClearButton100BY35(bgColor: .gray) )
                    }
                    
                    Text("Amount")
                        .bold()
                     
                    Spacer()
                }
                .padding()
                
                VStack(spacing: 20) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Title")
                                .bold()
                            TextField("Title", text: $title)
                                .frame(width: 300)
                                .padding(10)
                                .background(
                                    Rectangle()
                                        .cornerRadius(10)
                                        .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                                    
                                )
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text("Caption")
                                .bold()
                            TextField("Caption", text: $caption)
                                .frame(width: 300)
                                .padding(10)
                                .background(
                                    Rectangle()
                                        .cornerRadius(10)
                                        .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                                    
                                )
                            
                        }
                        
                        Spacer()
                    }
                    
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Description")
                                .bold()
                            
                            MultiLineTextField(placeholderText: "description", text: $description)
                                .frame(width: 350 , height: 100)
                                .padding(10)
                                .background(
                                    Rectangle()
                                        .cornerRadius(10)
                                        .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                                )
                            
                            
                        }
                        
                        Spacer()
                    }
                    
                    
                
                    
                    
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Button(action: {
                                showCondition.toggle()
                            }) {
                                Text("+ Condition type")
                                    .modifier(myClearButton380BY45(bgColor: .black))
                            }
                            
                        }
                        
                        Spacer()
                    }
                }
                .padding()
            }
        }
    }
}

struct EditCollectionFieldItemsView_Previews: PreviewProvider {
    static var previews: some View {
        EditCollectionFieldItemsView(id: .constant("123"), title: .constant("yoooooo"), caption: .constant("tooo"), description: .constant("voivo oirwj oiowj oiejwo"), amount: .constant("50"), likes: .constant(90), onSale: .constant(false), images: .constant(["collection1"]), sequenceCount: .constant(0), conditions: .constant(["String"]), active: .constant(true), showCondition: .constant(false))
    }
}
