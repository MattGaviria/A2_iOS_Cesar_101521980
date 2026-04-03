import CoreData
import SwiftUI

struct ProductSearchView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.wrappedName, ascending: true)],
        animation: .default
    ) private var products: FetchedResults<Product>

    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            List {
                Section("Search") {
                    TextField("Type product name or description", text: $searchText)
                        .textInputAutocapitalization(.never)
                }

                Section("Results") {
                    ForEach(products) { product in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(product.wrappedName)
                                .font(.headline)
                            Text(product.wrappedDescription)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Search")
        }
    }
}
