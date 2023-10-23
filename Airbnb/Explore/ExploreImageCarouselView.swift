import SwiftUI

struct ExploreImageCarouselView: View {
    var height = 320.0
    var body: some View {
        TabView {
            ForEach(0 ..< 5) { item in
                Image("image\(item)")
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
        .frame(height: height)
    }
}

#Preview {
    ExploreImageCarouselView()
}
