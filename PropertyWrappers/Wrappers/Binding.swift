//
//  Binding.swift
//  PropertyWrappers
//
//  Created by Артём Скрипкин on 29.01.2023.
//

import SwiftUI

struct BindingWrapper: View {

    @State var showColor = false

    var body: some View {
        HStack {
            Button("Show color") {
                showColor = true
            }
        }
        .sheet(isPresented: $showColor) {
            ShowColorView(isShowed: $showColor)
        }
    }
}

private struct ShowColorView: View {
    @Binding var isShowed: Bool

    var body: some View {
        VStack {
            Color(.blue)
                .overlay {
                    Button("Dismiss") {
                        isShowed = false
                    }
                }
        }
    }
}
