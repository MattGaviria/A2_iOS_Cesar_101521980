import CoreData
import SwiftUI

struct ProductListView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.productName, ascending: true)],
        animation: .default
    ) private var products: FetchedResults<Product>

    var body: some View {
        NavigationStack {
            Group {
                if products.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "tray")
                            .font(.largeTitle)
                            .foregroundColor(.gray)

                        Text("No Products")
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
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
