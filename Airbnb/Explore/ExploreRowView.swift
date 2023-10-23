import SwiftUI

struct ExploreRowView: View {
    var body: some View {
        VStack {
            ExploreImageCarouselView()
                .clipShape(RoundedRectangle(cornerRadius: 10))

            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)

                    Text("12 mi away")
                        .foregroundStyle(.secondary)

                    Text("Nov 3 - 10")
                        .foregroundStyle(.secondary)

                    Text("$567 ")
                        .fontWeight(.semibold)

                    + Text("night")
                }
                Spacer()

                ExploreRatingView()
            }
            .font(.footnote)
        }
    }
}

#Preview {
//    ExploreRowView()
    ExploreView()
}
