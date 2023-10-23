import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView)
            } else {
                ScrollView {
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
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
}

#Preview {
    ExploreView()
}
