import SwiftUI
import MapKit

struct ExploreDetailView: View {
    let item: Int
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView {
            ExploreImageCarouselView()
                .overlay(alignment: .topLeading) {
                    Button(action: {
                        print("click")
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .background(
                                Circle()
                                    .fill(.white)
                                    .frame(width: 32, height: 32)
                            )
                            .padding(.top, 90)
                            .padding(.leading, 40)
                    }
                }
            VStack(alignment: .leading, spacing: 8) {
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                VStack(alignment:.leading) {
                    HStack {
                        ExploreRatingView()
                        Text("-")
                        Text("28 reviews")
                            .font(.caption)
                            .underline()
                            .fontWeight(.semibold)
                    }
                    Text("Miami, Florida")
                }
                .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            Divider()

            HStack {
                VStack(alignment: .leading) {
                    Text("Entire villa hosted by John Smith")
                        .font(.headline)
                    HStack(spacing: 2) {
                        Text("4 guests -")
                        Text("4 bedrooms -")
                        Text("4 beds -")
                        Text("3 baths")
                    }
                    .font(.caption)
                }
                Spacer()
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding(.horizontal)

            Divider()

            VStack {
                ForEach(0..<2) { _ in
                    HStack(spacing: 12) {
                        Image(systemName: "medal")
                        VStack(alignment: .leading) {
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text("Superhosts are experience, highly rated hosts who are commited to profiding great stars for guests")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            Divider()

            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll sleep")
                    .font(.headline)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(1..<10) { index in
                            VStack(alignment: .leading) {
                                Image(systemName: "bed.double")
                                Text("Bedroom \(index)")
                            }
                            .padding(4)
                            .frame(width: 132, height: 100)
                            .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(Color.secondary, lineWidth: 1))
                        }
                    }
                }
                .scrollTargetBehavior(.paging)

            }
            .padding(.horizontal)

            Divider()

            VStack(alignment: .leading, spacing: 16) {
                Text("What this place offers")
                    .font(.headline)

                ForEach(0..<5) { _ in
                    HStack {
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        Text("Wifi")
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .padding(.horizontal)

            Divider()

            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)

                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding(.horizontal)
        }
        .toolbar(.hidden, for: .navigationBar, .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 100)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                HStack {
                    VStack(alignment: .leading) {
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Total before taxes")
                        Text("Oct 15 - 20")
                            .fontWeight(.semibold)
                            .underline()

                    }
                    .font(.footnote)
                    Spacer()
                    Button("Reserve") {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.pink)
                }
                .padding(.horizontal)
            }
            .background(Color.white)
        }
    }
}

#Preview {
    ExploreDetailView(item: 1)
}
