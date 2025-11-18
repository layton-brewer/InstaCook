import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView("Generating recipe...")
            .progressViewStyle(CircularProgressViewStyle())
            .padding()
    }
}
