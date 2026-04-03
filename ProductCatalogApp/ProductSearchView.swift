import CoreData
import SwiftUI

struct ProductSearchView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.productName, ascending: true)],
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
                    ForEach(filteredProducts) { product in
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

    private var filteredProducts: [Product] {
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else {
            return Array(products)
        }

        return products.filter { product in
            product.wrappedName.localizedCaseInsensitiveContains(query) ||
            product.wrappedDescription.localizedCaseInsensitiveContains(query)
        }
    }
}
