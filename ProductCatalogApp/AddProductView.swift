import SwiftUI

struct AddProductView: View {
    @State private var productName = ""
    @State private var productDescription = ""
    @State private var productProvider = ""
    @State private var productPrice = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Product Details") {
                    TextField("Product Name", text: $productName)
                    TextField("Product Description", text: $productDescription, axis: .vertical)
                    TextField("Product Provider", text: $productProvider)
                    TextField("Product Price", text: $productPrice)
                        .keyboardType(.decimalPad)
                }

                Section {
                    Button("Add Product") {
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .navigationTitle("Add Product")
        }
    }
}
