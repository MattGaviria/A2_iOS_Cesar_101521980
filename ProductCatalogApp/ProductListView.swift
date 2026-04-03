import CoreData
import SwiftUI

struct ProductListView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.productName, ascending: true)],
        animation: .default
    ) private var products: FetchedResults<Product>

    var body: some View {
        NavigationStack {
            if products.isEmpty {
                ContentUnavailableView("No Products", systemImage: "tray")
            } else {
                List(products) { product in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(product.wrappedName)
                            .font(.headline)

                        Text(product.wrappedDescription)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("All Products")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Total: \(products.count)")
                        .font(.caption)
                }
            }
        }
    }
}
