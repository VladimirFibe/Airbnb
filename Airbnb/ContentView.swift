import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView {
                ExploreView()
                WishListView()
                ProfileView()
            }
    }
}

#Preview {
    ContentView()
}
