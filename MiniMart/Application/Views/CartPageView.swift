//
//  CartPageView.swift
//  MiniMart
//
//  Created by HIBIKI CUBE on 2021/08/17.
//

import SwiftUI
import Combine

final class CartState: ObservableObject {
    @Published var products: [FetchProductsQuery.Data.Product] = []
}



struct CartPageView: View {
    @EnvironmentObject var cartState: CartState
    @State var renderedProducts: [FetchProductsQuery.Data.Product] = []
    
    func handleSameProducts(product: FetchProductsQuery.Data.Product) -> Int {
//        renderedProducts += [product]
        return cartState.products.filter {$0.id == product.id}.count
    }
    
    var body: some View {
        List(cartState.products, id: \.id){ product in
                HStack {
                    RemoteImage(urlString: product.imageUrl)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .aspectRatio(contentMode: .fill)
                    Text(product.name)
                        .font(.title)
                        .padding(16)
                    Text("\(product.price)円 × \(handleSameProducts(product: product))")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            
        }
        .navigationTitle("カート")
    }
}

struct CartPageView_Previews: PreviewProvider {
    static var previews: some View {
        CartPageView()
    }
}
