//
//  ProductDetailPageView.swift
//  MiniMart
//
//  Created by HIBIKI CUBE on 2021/08/17.
//

import SwiftUI

struct ProductDetailPageView: View {
    @EnvironmentObject var cartState: CartState
    var product: FetchProductsQuery.Data.Product
    @State var isCartViewPresented: Bool = false
    var body: some View {
        VStack {
            RemoteImage(urlString: product.imageUrl)
                .frame(height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            ScrollView{
                HStack{
                    Text(product.name)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                    Text("\(product.price)円")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(16)
                }
                Text(product.summary)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16)
            }
            VStack {
                Button(action: {cartState.products += [product]}) {
                    Text("カートに追加")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding(16)
                }
                .frame(maxWidth: .infinity)
                .background(Color(UIColor(red: 1.000, green: 0.588, blue: 0.000, alpha: 1.000)))
                .cornerRadius(15.0, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .padding(8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .frame(maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle(product.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing){
                Button(action: {
                    self.isCartViewPresented = true
                }) {
                    Image(systemName: "cart")
                }
            }
        }
        .sheet(isPresented: $isCartViewPresented) {
            NavigationView {
                CartPageView()
            }
        }
    }
}

struct ProductDetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailPageView(
            product: FetchProductsQuery.Data.Product(
                id: UUID().uuidString,
                name: "商品 \(1)",
                price: 100,
                summary: "可愛いねこ \(1)",
                imageUrl: "http://placekitten.com/330/220"
            )
        )
    }
}
