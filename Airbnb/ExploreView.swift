import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                SearchAndFilterBar()
                LazyVStack(spacing: 32) {
                    ForEach(0 ..< 5) { item in
                        NavigationLink(value: item) {
                            ExploreRowView()
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Title")
            .navigationDestination(for: Int.self) { item in
                ExploreDetailView(item: item)
            }
        }
    }
}

#Preview {
    ExploreView()
}
