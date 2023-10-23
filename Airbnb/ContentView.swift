import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView {
                WishListView()
                ProfileView()
                ExploreView()
            }
    }
}

#Preview {
    ContentView()
}
