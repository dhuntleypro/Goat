//
//  ProductDetailsView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//



import SwiftUI

struct ProductDetailsView: View {
    @EnvironmentObject var authEO : AuthViewModel // can case nav bug
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    
    @ObservedObject var viewModel : ProductActionViewModel
    
    
    
    @State var want = false
    @State var isOpen = true
    @State var lightBg = false
    @State var maxHeight = 0
    @State var showBottonView = true
    @State var selected_Size : Bool = false
    @State var selectedSize : String = ""
    @State var selectedSizePrice : Float = 0.0
    @State var isSwiped = false
    @State var offset : CGFloat = 0
    @State var total : Float = 0.0
    @State var setModalHeight : CGFloat = 100
    @State var quantity = 1
    @State var showAddToCartAlert = false
    @State var showCommonBanner = true
    
    
    
    var product: Product
    
    init(
        // showCart: Binding<Bool>,
        product: Product) {
        
        self.product = product
        
        self.viewModel = ProductActionViewModel(product: product)
        // self._showCart = showCart
        
    }
    
    
    var body: some View {
        
        
        ZStack {
            
            Color(.white).edgesIgnoringSafeArea(.all)
            
            
            ScrollView {

                VStack {
                   
                //    BannerView(showAddToCartAlert: $showAddToCartAlert, showCommonBanner: $showCommonBanner)
                    
                    ImageSiderView( product: product)
                    
                    ExpressAndCart(viewModel: viewModel, product: product, selectedSize: $selectedSize ,  selectedSizePrice: $selectedSizePrice, total: $total, showAddToCartAlert: $showAddToCartAlert, setModalHeight: $setModalHeight )
                    
                    Text(product.name)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.black)
                        .lineLimit(3)
                        .multilineTextAlignment(.center)
                        .padding(.vertical ,20)
                    
                    Divider()
                    
                    ProductCategorySliderView(product: product)
                    
                    DescriptionView(product: product)
                    
                    ShippingProductView()
                    
                    YouMayAlsoLikeView()
                    
                   
                }
            }



            VStack {
                
                Spacer()
               
                BottomSheetSizeView(selectedSize: $selectedSize, selectedSizePrice: $selectedSizePrice, isSwiped: $isSwiped , offset : $offset, isOpen: $isOpen, lightBg: $lightBg, bgColor: .black, product: product, selected_Size: $selected_Size, setModalHeight: $setModalHeight, total: $total)

            }

           
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:

                Button(action: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.presentation.wrappedValue.dismiss()
                    }
                }) {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                }
            , trailing:
                HStack {
                    NavigationLink(destination: CartView()

                    ) {
                        Image(systemName: "cart")
                            .font(.system(size:20))
                            .foregroundColor(.black)
                    }
                    
                    NavigationLink(destination: WantView()) {
                        Text(product.want ? "Added" : "Want")
                            .foregroundColor(.black)
                            .modifier(product.want ? myClearButton100BY35(bgColor: .black) :  myClearButton100BY35(bgColor: .gray))
                        
                    }
                }
                
            
            
        )
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductDetailsView(product: Product(dictionary: ["String" : "Any"]))

        }
    }
}

