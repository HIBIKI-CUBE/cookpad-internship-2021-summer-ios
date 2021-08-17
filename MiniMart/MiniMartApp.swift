import SwiftUI

@main
struct MiniMartApp: App {
    @State var cartState = CartState()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ProductListPageView()
            }
            .environmentObject(cartState)
        }
    }
}
