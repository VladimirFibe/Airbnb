import SwiftUI

struct WishListView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32.0) {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("Login to view your wishlists")
                        .font(.headline)
                    Text("You can create, view or edit wishlists once you've logged in")
                        .font(.footnote)
                }
                Button(action: {}) {
                    Text("Log in")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.pink)

                HStack {
                    Text("Don't have an account?")

                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)

                Spacer()
            }
            .padding()
            .navigationTitle("Wishlist")
        }
    }
}

#Preview {
    WishListView()
}
