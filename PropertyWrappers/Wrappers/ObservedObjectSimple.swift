//
//  ObservedObjectSimple.swift
//  PropertyWrappers
//
//  Created by Артём Скрипкин on 30.01.2023.
//

import SwiftUI

private class CarInfo: ObservableObject {
    @Published var name = "My Car"
    @Published var color = "Red"
}

struct ObservedObjectSimpleWrapper: View {

    @State var isShowed = false
    // 2
    @ObservedObject private var carInfo = CarInfo()

    var body: some View {
        VStack {
            Button("Change car name to random") {
                carInfo.name = "My Car \(Int.random(in: 0...10))"
            }
            Button("Show car info") {
                isShowed.toggle()
            }
        }.sheet(isPresented: $isShowed) {
            // 3
            SheetView(carInfo: carInfo)
        }
    }
}

private struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    // 4
    @ObservedObject var carInfo: CarInfo

    var body: some View {
        VStack {
            HStack {
                Text("Car name: \(carInfo.name)")
                    .padding(15)
                Text("Car color: \(carInfo.color)")
            }
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}
