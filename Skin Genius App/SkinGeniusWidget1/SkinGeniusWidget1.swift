//import WidgetKit
//import SwiftUI
//
//struct Provider: TimelineProvider {
//    func placeholder(in context: Context) -> SimpleEntry {
//        SimpleEntry(date: Date(), morningRoutineStatus: "Pending", eveningRoutineStatus: "Pending")
//    }
//
//    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
//        let morningStatus = UserDefaults.standard.string(forKey: "morningRoutineStatus") ?? "Pending"
//        let eveningStatus = UserDefaults.standard.string(forKey: "eveningRoutineStatus") ?? "Pending"
//        print("Morning Status in Widget: \(morningStatus)") // Debugging print statement
//            print("Evening Status in Widget: \(eveningStatus)")
//        let entry = SimpleEntry(date: Date(), morningRoutineStatus: morningStatus, eveningRoutineStatus: eveningStatus)
//        completion(entry)
//    }
//
//    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        var entries: [SimpleEntry] = []
//
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let morningStatus = UserDefaults.standard.string(forKey: "morningRoutineStatus") ?? "Pending"
//            let eveningStatus = UserDefaults.standard.string(forKey: "eveningRoutineStatus") ?? "Pending"
//            let entry = SimpleEntry(date: entryDate, morningRoutineStatus: morningStatus, eveningRoutineStatus: eveningStatus)
//            entries.append(entry)
//        }
//
//        let timeline = Timeline(entries: entries, policy: .atEnd)
//        completion(timeline)
//    }
//}
//
//struct SimpleEntry: TimelineEntry {
//    let date: Date
//    let morningRoutineStatus: String
//    let eveningRoutineStatus: String
//}
//
//struct SkinGeniusWidget1EntryView : View {
//    var entry: Provider.Entry
//
//    var body: some View {
//        VStack {
//            Text("Time:")
//            Text(entry.date, style: .time)
//
//            Text("Morning Routine:")
//            Text(entry.morningRoutineStatus)
//
//            Text("Evening Routine:")
//            Text(entry.eveningRoutineStatus)
//        }
//    }
//}
//
//struct SkinGeniusWidget1: Widget {
//    let kind: String = "SkinGeniusWidget1"
//
//    var body: some WidgetConfiguration {
//        StaticConfiguration(kind: kind, provider: Provider()) { entry in
//            if #available(iOS 17.0, *) {
//                SkinGeniusWidget1EntryView(entry: entry)
//                    .containerBackground(.fill.tertiary, for: .widget)
//            } else {
//                SkinGeniusWidget1EntryView(entry: entry)
//                    .padding()
//                    .background()
//            }
//        }
//        .configurationDisplayName("My Widget")
//        .description("This is an example widget.")
//    }
//}
//
//#Preview(as: .systemSmall) {
//    SkinGeniusWidget1()
//} timeline: {
//    SimpleEntry(date: .now, morningRoutineStatus: "Completed", eveningRoutineStatus: "Pending")
//}
//
import WidgetKit
import SwiftUI

// Define a data structure for skin care products
struct SkinCareProduct {
    let name: String
    let description: String
    let fact: String
}

// Pre-load an array of 20 products and facts
let products: [SkinCareProduct] = [
    SkinCareProduct(name: "Hydrating Serum", description: "Boosts skin's moisture levels.", fact: "Did you know? Serums are typically lighter than moisturizers and can be layered under them."),
    SkinCareProduct(name: "SPF 50 Sunscreen", description: "Protects against harmful UV rays.", fact: "Did you know? Sunscreen should be applied every two hours when outdoors."),
    SkinCareProduct(name: "Retinol Cream", description: "Promotes cell turnover and reduces wrinkles.", fact: "Did you know? Retinol should be used at night as it can make skin more sensitive to sunlight."),
    SkinCareProduct(name: "Vitamin C Serum", description: "Brightens skin and reduces dark spots.", fact: "Did you know? Vitamin C can help protect your skin from free radical damage."),
    SkinCareProduct(name: "Moisturizing Gel", description: "Provides hydration without a greasy feel.", fact: "Did you know? Gel moisturizers are great for oily skin types."),
    SkinCareProduct(name: "Clay Mask", description: "Detoxifies and purifies skin.", fact: "Did you know? Clay masks can help reduce the appearance of pores."),
    SkinCareProduct(name: "Exfoliating Scrub", description: "Removes dead skin cells for a smoother complexion.", fact: "Did you know? Exfoliating helps to prevent clogged pores."),
    SkinCareProduct(name: "Niacinamide Serum", description: "Reduces inflammation and improves skin texture.", fact: "Did you know? Niacinamide can help control sebum production."),
    SkinCareProduct(name: "Hyaluronic Acid", description: "Hydrates and plumps skin.", fact: "Did you know? Hyaluronic acid can hold up to 1000 times its weight in water."),
    SkinCareProduct(name: "Aloe Vera Gel", description: "Soothes and calms irritated skin.", fact: "Did you know? Aloe vera has anti-inflammatory properties."),
    SkinCareProduct(name: "Charcoal Cleanser", description: "Deep cleanses and removes impurities.", fact: "Did you know? Charcoal can help draw out toxins from the skin."),
    SkinCareProduct(name: "Cucumber Eye Gel", description: "Reduces puffiness and dark circles around the eyes.", fact: "Did you know? Cucumber has a cooling effect that can help reduce swelling."),
    SkinCareProduct(name: "Green Tea Toner", description: "Balances and refreshes skin.", fact: "Did you know? Green tea is rich in antioxidants."),
    SkinCareProduct(name: "Shea Butter Cream", description: "Nourishes and softens dry skin.", fact: "Did you know? Shea butter is packed with vitamins and fatty acids."),
    SkinCareProduct(name: "Tea Tree Oil", description: "Treats acne and blemishes.", fact: "Did you know? Tea tree oil has antibacterial properties."),
    SkinCareProduct(name: "Rose Water Mist", description: "Hydrates and revitalizes skin.", fact: "Did you know? Rose water can help maintain the skin's pH balance."),
    SkinCareProduct(name: "Glycolic Acid Toner", description: "Exfoliates and brightens skin.", fact: "Did you know? Glycolic acid can help improve skin texture."),
    SkinCareProduct(name: "Collagen Booster", description: "Enhances skin elasticity and firmness.", fact: "Did you know? Collagen is a key protein for youthful-looking skin."),
    SkinCareProduct(name: "Lavender Night Cream", description: "Calms and rejuvenates skin overnight.", fact: "Did you know? Lavender can help reduce stress and improve sleep quality."),
    SkinCareProduct(name: "Papaya Enzyme Mask", description: "Gently exfoliates and brightens skin.", fact: "Did you know? Papaya enzymes can help dissolve dead skin cells.")
]

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), product: products[0])
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let product = getProductForToday()
        let entry = SimpleEntry(date: Date(), product: product)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for dayOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            let product = getProductForToday(date: entryDate)
            let entry = SimpleEntry(date: entryDate, product: product)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    func getProductForToday(date: Date = Date()) -> SkinCareProduct {
        // Get the day of the year
        let dayOfYear = Calendar.current.ordinality(of: .day, in: .year, for: date) ?? 0
        // Cycle through the products array based on the day of the year
        let productIndex = dayOfYear % products.count
        return products[productIndex]
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let product: SkinCareProduct
}
struct SkinGeniusWidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        @Environment(\.widgetFamily) var widgetFamily
        VStack(alignment: .leading, spacing: 5) {
            Text("Product of the Day")
                .font(.headline)
                .lineLimit(nil)
                .minimumScaleFactor(0.5)
            Text(entry.product.name)
                .font(.title2)
                .bold()
                .lineLimit(nil)
                .minimumScaleFactor(0.5)
            Text(entry.product.description)
                .font(.body)
                .lineLimit(nil)
                .minimumScaleFactor(0.5)
            Spacer()
            if widgetFamily == .systemSmall || widgetFamily == .systemMedium {
                // Don't show the fact in small and medium size widgets
                EmptyView()
            } else {
                // Show the fact in large widget size
                Text(entry.product.fact)
                    .font(.footnote)
                    .italic()
                    .lineLimit(nil)
            }
            Text(entry.date, style: .date)
                .font(.footnote)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
        }
        .padding()
    }
}


//struct SkinGeniusWidgetEntryView : View {
//    var entry: Provider.Entry
//    var body: some View {
//       @Environment(\.widgetFamily) var widgetFamily
//            switch widgetFamily {
//            case .systemSmall:
//                VStack {
//                    Text("Product of the Day")
//                        .font(.headline)
//                        .lineLimit(1)
//                    Text(entry.product.name)
//                        .font(.title2)
//                        .bold()
//                        .lineLimit(1)
//                }
//                .padding()
//            case .systemMedium:
//                VStack(alignment: .leading, spacing: 5) {
//                    Text("Product of the Day")
//                        .font(.headline)
//                        .lineLimit(nil)
//                        .minimumScaleFactor(0.5)
//                    Text(entry.product.name)
//                        .font(.title2)
//                        .bold()
//                        .lineLimit(nil)
//                        .minimumScaleFactor(0.5)
//                    Text(entry.product.description)
//                        .font(.body)
//                        .lineLimit(nil)
//                        .minimumScaleFactor(0.5)
//                    Spacer()
//
//                    Text(entry.date, style: .date)
//                        .font(.footnote)
//                        .lineLimit(1)
//                        .minimumScaleFactor(0.5)
//                }
//                .padding()
//            default:
//                VStack(alignment: .leading, spacing: 5) {
//                    Text("Product of the Day")
//                        .font(.headline)
//                        .lineLimit(nil)
//                        .minimumScaleFactor(0.5)
//                    Text(entry.product.name)
//                        .font(.title2)
//                        .bold()
//                        .lineLimit(nil)
//                        .minimumScaleFactor(0.5)
//                    Text(entry.product.description)
//                        .font(.body)
//                        .lineLimit(nil)
//                        .minimumScaleFactor(0.5)
//                    Spacer()
//                    ScrollView {
//                                        Text(entry.product.fact)
//                                            .font(.footnote)
//                                            .italic()
//                                            .lineLimit(nil)
//                                    }
//                                    Text(entry.date, style: .date)
//                                        .font(.footnote)
//                                        .lineLimit(1)
//                                }
//                                .padding()
//
//            }
//        }
//    }


//    var body: some View {
//        VStack(alignment: .leading, spacing: 5) {
//            Text("Product of the Day")
//                .font(.headline)
//                .lineLimit(nil)
//            Text(entry.product.name)
//                .font(.title2)
//                .bold()
//                .lineLimit(nil)
//            Text(entry.product.description)
//                .font(.body)
//                .lineLimit(nil)
//                .minimumScaleFactor(0.7)
//            Spacer()
//            Text(entry.product.fact)
//                .font(.footnote)
//                .italic()
//                .lineLimit(2)
//                .minimumScaleFactor(0.7)
//            Text(entry.date, style: .date)
//                .font(.footnote)
//            .lineLimit(1)}
//        .padding()
//    }
//}

struct SkinGeniusWidget: Widget {
    let kind: String = "SkinGeniusWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                SkinGeniusWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                SkinGeniusWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Skin Genius")
        .description("Daily skin care product and tips.")
    }
}

#Preview(as: .systemSmall) {
    SkinGeniusWidget()
} timeline: {
    SimpleEntry(date: .now, product: products[0])
}
