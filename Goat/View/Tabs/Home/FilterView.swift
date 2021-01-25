//
//  FilterView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/25/21.
//

import SwiftUI

struct FilterView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var onSale = false
    
    @State var showingCategoryOptions = false
    
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    Text("Gender")
                        .padding()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: 30) {
                        ForEach(MOCK_COLLECTION) { collection in
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text(collection.name)
                            })
                            .modifier(ClearButtonEven(bgColor: .black))
                        }
                    }
                    .padding(.leading)
                }
                
                //
                VStack(spacing: 20) {
                    Button(action: {
                        showingCategoryOptions.toggle()
                    }) {
                        HStack {
                            Text("Category")
                            Spacer()
                            Text("ALL")
                        }
                        .foregroundColor(.black)
                    }
                    .actionSheet(isPresented: $showingCategoryOptions) {
                                ActionSheet(
                                    title: Text("What do you want to do?"),
                                    message: Text("There's only one choice..."),
                                    buttons: [
                                       
                                            .default(Text("Dismiss Action Sheet"))
                                    
                                    
                                    ])
                            }
                    
                    
                    HStack {
                        Text("Sale")
                        Spacer()
                        Toggle(isOn: $onSale) {
                            
                            Text(onSale ? "" : "")
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                            
                        }
                    }
                    
                    HStack {
                        Text("Size")
                        Spacer()
                        Text("ALL")
                    }
                    
                    HStack {
                        Text("Brand")
                        Spacer()
                        Text("ALL")
                    }
                    
                    HStack {
                        Text("Color")
                        Spacer()
                        Text("ALL")
                    }
                    
                }
                .padding()
                Spacer()
                
            }
            .navigationBarTitle("FILTERS", displayMode: .inline)
            
            .navigationBarItems(
                leading:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        
                    }, label: {
                        Text("Close")
                            .foregroundColor(.black)
                    })
                , trailing:
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Reset")
                            .foregroundColor(.black)
                        
                    })
            )
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
