//
//  CalendarDropdown.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 30/12/23.
//

import SwiftUI

struct CalendarDropdown: View {

    @Binding var selectedDate: Date
    @State private var showDatePicker = false

    private var calendarLimit: PartialRangeThrough<Date> {
        let currentDate = Date()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? currentDate
        let endDate = DateFormatter.hour.string(from: currentDate) >= "21" ? tomorrow : currentDate
        return ...endDate
    }

    var body: some View {
        dropdown
            .overlay(overlayDatePicker, alignment: .topLeading)
    }

    private var dropdown: some View {
        Button(action: { showDatePicker.toggle() }, label: {
            HStack {
                Text(selectedDate, style: .date)
                Spacer()
                Image(systemName: "calendar")
            }
        })
        .LPFont(.roboto(16, weight: .medium), color: .customBlack)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
        )
    }

    private var overlayDatePicker: some View {
        VStack {
            if showDatePicker {
                Spacer(minLength: 55)
                datePicker
            }
        }
    }

    private var datePicker: some View {
        DatePicker("", selection: $selectedDate, in: calendarLimit, displayedComponents: [.date])
            .datePickerStyle(.graphical)
            .padding()
            .background(Color.customWhite)
            .border(Color.gray.opacity(0.4))
            .onChange(of: selectedDate) { _ in
                showDatePicker.toggle()
            }
    }
}

#Preview {
    CalendarDropdown(selectedDate: .constant(Date()))
        .padding()
}
