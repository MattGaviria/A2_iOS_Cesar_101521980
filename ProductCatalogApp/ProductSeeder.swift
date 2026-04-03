import CoreData
import Foundation

enum ProductSeeder {
    static func seedIfNeeded(in context: NSManagedObjectContext) {
        let request = Product.fetchRequest()
        request.fetchLimit = 1

        do {
            let count = try context.count(for: request)
            if count > 0 {
                return
            }

            let sampleProducts: [(String, String, Double, String)] = [
                ("Laptop Sleeve", "Protective 13-inch laptop sleeve", 24.99, "UrbanTech"),
                ("Wireless Mouse", "Ergonomic Bluetooth mouse", 19.99, "ClickPro"),
                ("Mechanical Keyboard", "Compact keyboard with blue switches", 59.99, "KeyForge"),
                ("USB-C Hub", "6-in-1 hub with HDMI and USB ports", 34.50, "PortPlus"),
                ("Noise Cancelling Headphones", "Over-ear headphones with ANC", 129.00, "SoundPeak"),
                ("Smart Water Bottle", "Tracks hydration with LED reminders", 39.95, "HydraSmart"),
                ("Phone Stand", "Adjustable aluminum desk stand", 14.75, "DeskFlow"),
                ("Webcam", "1080p USB webcam with built-in mic", 42.25, "VisionCam"),
                ("Portable SSD", "1TB high-speed portable storage", 109.99, "DataDash"),
                ("LED Desk Lamp", "Dimmable lamp with touch controls", 27.40, "BrightNest")
            ]

            for item in sampleProducts {
                let product = Product(context: context)
                product.productID = UUID()
                product.productName = item.0
                product.productDescriptionText = item.1
                product.productPrice = item.2
                product.productProvider = item.3
                product.createdAt = Date()
            }

            try context.save()
        } catch {
            print("Failed to seed products: \(error.localizedDescription)")
        }
    }
}
