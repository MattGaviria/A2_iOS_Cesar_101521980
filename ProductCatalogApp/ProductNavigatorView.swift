import CoreData
import SwiftUI

struct ProductNavigatorView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.wrappedCreatedAt, ascending: true)],
        animation: .default
    ) private var products: FetchedResults<Product>

    @State private var currentIndex = 0

    var body: some View {
        VStack(spacing: 16) {
            Text("First Product View")
                .font(.title2)
                .fontWeight(.bold)

            if let current = currentProduct {
                ProductCardView(product: current)
            } else {
                Text("No products available.")
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding()
        .onAppear {
            ProductSeeder.seedIfNeeded(in: viewContext)
            currentIndex = 0
        }
    }

    private var currentProduct: Product? {
        guard !products.isEmpty, currentIndex < products.count else {
            return nil
        }
        return products[currentIndex]
    }
}
