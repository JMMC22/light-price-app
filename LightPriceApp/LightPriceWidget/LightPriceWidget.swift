//
//  LightPriceWidget.swift
//  LightPriceWidget
//
//  Created by José María Márquez Crespo on 11/11/24.
//

import WidgetKit
import SwiftUI
import LPDesignSystem

struct Provider: TimelineProvider {

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), rangeHour: "14-15", value: 0.061)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), rangeHour: "14-15", value: 0.061)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, rangeHour: "14-15", value: 0.061)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let rangeHour: String
    let value: Double
}

struct LightPriceWidgetEntryView : View {

    var entry: Provider.Entry

    var body: some View {
        VStack(spacing: 8) {
            Text("Best time today")
                .LPFont(.Roboto(16, weight: .bold), color: .customBlack)

            VStack(spacing: 4) {
                Text("\(entry.rangeHour)h")
                    .LPFont(.Roboto(36, weight: .blackItalic), color: .customBlack)
                Text(String(entry.value) + " €/kWh")
                    .LPFont(.Roboto(12, weight: .bold), color: .customGreen)
            }
        }
    }
}

struct LightPriceWidget: Widget {

    let kind: String = "LightPriceWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                LightPriceWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                LightPriceWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    LightPriceWidget()
} timeline: {
    SimpleEntry(date: .now, rangeHour: "14-15", value: 0.50)
    SimpleEntry(date: .now, rangeHour: "00-01", value: 0.156)
}
