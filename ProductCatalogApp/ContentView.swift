import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProductNavigatorView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            ProductSearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            ProductListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }

            AddProductView()
                .tabItem {
                    Label("Add", systemImage: "plus.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
