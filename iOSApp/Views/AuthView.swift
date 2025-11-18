import SwiftUI

struct AuthView: View {
    @EnvironmentObject var authVM: AuthViewModel

    var body: some View {
        VStack(spacing: 16) {
            if let user = authVM.currentUser {
                Text("Signed in as \(user.email ?? user.id)")
            } else {
                Text("Not signed in")
            }

            Text("Clerk authentication will be integrated here.")
                .font(.footnote)
                .foregroundColor(.secondary)

            Spacer()
        }
        .padding()
        .navigationTitle("Account")
    }
}
