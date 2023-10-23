import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32.0) {
            VStack(alignment: .leading, spacing: 8.0) {
                Text("Profile")
                    .font(.largeTitle)
                .fontWeight(.semibold)

                Text("Login to start planing your next trip")
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

            VStack(alignment: .leading, spacing: 24) {
                ProfileRow(image: "gear", title: "Setting")
                ProfileRow(image: "gear", title: "Accessiblity")
                ProfileRow(image: "questionmark.circle", title: "Visit the Help Center")
            }
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
