import SwiftUI

struct AddProductView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State private var productName = ""
    @State private var productDescription = ""
    @State private var productProvider = ""
    @State private var productPrice = ""
    @State private var saveMessage = ""

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
                        saveProduct()
                    }
                    .frame(maxWidth: .infinity)
                }

                if !saveMessage.isEmpty {
                    Section {
                        Text(saveMessage)
                            .foregroundStyle(.green)
                    }
                }
            }
            .navigationTitle("Add Product")
        }
    }

    private func saveProduct() {
        guard let price = Double(productPrice) else {
            saveMessage = "Please enter a valid price."
            return
        }

        let newProduct = Product(context: viewContext)
        newProduct.productID = UUID()
        newProduct.productName = productName
        newProduct.productDescriptionText = productDescription
        newProduct.productProvider = productProvider
        newProduct.productPrice = price
        newProduct.createdAt = Date()

        do {
            try viewContext.save()
            saveMessage = "Product added successfully."
            productName = ""
            productDescription = ""
            productProvider = ""
            productPrice = ""
        } catch {
            saveMessage = "Failed to save product."
        }
    }
}
