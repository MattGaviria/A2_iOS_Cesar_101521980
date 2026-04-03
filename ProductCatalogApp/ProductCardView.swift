import SwiftUI

struct ProductCardView: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(product.wrappedName)
                .font(.headline)

            Text(product.wrappedDescription)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(String(format: "$%.2f", product.productPrice))
                .font(.title3)
                .fontWeight(.semibold)

            Text("Provider: \(product.wrappedProvider)")
                .font(.footnote)

            Text("ID: \(product.wrappedID.uuidString)")
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
