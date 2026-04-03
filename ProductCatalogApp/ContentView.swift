import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ProductNavigatorView()
                .navigationTitle("Products")
        }
    }
}

#Preview {
    ContentView()
}
