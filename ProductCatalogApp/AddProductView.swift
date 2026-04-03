import SwiftUI

struct AddProductView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State private var productName = ""
    @State private var productDescription = ""
    @State private var productProvider = ""
    @State private var productPrice = ""
    @State private var saveMessage = ""
    @State private var isErrorMessage = false

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
                            .foregroundStyle(isErrorMessage ? .red : .green)
                    }
                }
            }
            .navigationTitle("Add Product")
        }
    }

    private func saveProduct() {
        let name = productName.trimmingCharacters(in: .whitespacesAndNewlines)
        let description = productDescription.trimmingCharacters(in: .whitespacesAndNewlines)
        let provider = productProvider.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !name.isEmpty, !description.isEmpty, !provider.isEmpty else {
            isErrorMessage = true
            saveMessage = "All fields are required."
            return
        }

        guard let price = Double(productPrice) else {
            isErrorMessage = true
            saveMessage = "Please enter a valid price."
            return
        }

        let newProduct = Product(context: viewContext)
        newProduct.productID = UUID()
        newProduct.productName = name
        newProduct.productDescriptionText = description
        newProduct.productProvider = provider
        newProduct.productPrice = price
        newProduct.createdAt = Date()

        do {
            try viewContext.save()
            isErrorMessage = false
            saveMessage = "Product added successfully."
            productName = ""
            productDescription = ""
            productProvider = ""
            productPrice = ""
        } catch {
            isErrorMessage = true
            saveMessage = "Failed to save product."
        }
    }
}
