//
//  DashCollectionListView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI

struct DashCollectionListView: View {
    @ObservedObject var collectionVM = CollectionViewModel()
    
    @State var isShowingNewCollectionView = false
    
    private func delayFetch() {
        // Delay of 2.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            collectionVM.fetchCollections()
            
        }
    }
    var body: some View {
        
        VStack(spacing: 0) {
            HStack {
                Text("Collections")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                
                Spacer()
                
                Button(action: {
                    self.isShowingNewCollectionView.toggle()
                    
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                }
                .fullScreenCover(isPresented: $isShowingNewCollectionView ,  onDismiss: delayFetch) {
                    CreateCollectionView(isPresented: $isShowingNewCollectionView)
                }
            }
            .padding()
            
            // Slider
            ScrollView(.horizontal , showsIndicators: true){
                
                HStack {
                    
                    ForEach(collectionVM.collections) { collection in
                        
                        NavigationLink(destination: EditCollectionView( collection: collection,
                                                                        id : collection.id,
                                                                        
                                                                        title: collection.title ,
                                                                        caption: collection.caption,
                                                                        description: collection.description,
                                                                        amount: String(collection.amount),
                                                                        likes: collection.likes,
                                                                        onSale: collection.onSale,
                                                                        images: collection.images,
                                                                        sequenceCount: collection.sequenceCount,
                                                                        active: collection.active,
                                                                        condition: collection.conditions
                                                                        
                        )) {
                            CollectionCell01(collection: collection)
                        }
                    }
                }
                .padding(.leading)
            }
        }
        .onAppear() {
            collectionVM.fetchCollections()
        }
    }
}

struct DashCollectionListView_Previews: PreviewProvider {
    static var previews: some View {
        DashCollectionListView()
    }
}

