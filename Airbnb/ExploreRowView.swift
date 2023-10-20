import SwiftUI

struct ExploreRowView: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack {
                Text("Miami, Florida")

                Text("12 mi away")

                Text("Nov 3 - 10")

                Text("$567")
            }
        }
    }
}

#Preview {
//    ExploreRowView()
    ExploreView()
}
