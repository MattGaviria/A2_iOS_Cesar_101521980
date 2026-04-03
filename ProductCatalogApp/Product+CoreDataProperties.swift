import CoreData
import Foundation

extension Product {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var productID: UUID?
    @NSManaged public var productName: String?
    @NSManaged public var productDescriptionText: String?
    @NSManaged public var productPrice: Double
    @NSManaged public var productProvider: String?
    @NSManaged public var createdAt: Date?
}

extension Product: Identifiable {
    public var wrappedID: UUID { productID ?? UUID() }
    public var wrappedName: String { productName ?? "Unknown Product" }
    public var wrappedDescription: String { productDescriptionText ?? "No description" }
    public var wrappedProvider: String { productProvider ?? "Unknown Provider" }
    public var wrappedCreatedAt: Date { createdAt ?? .distantPast }
}
