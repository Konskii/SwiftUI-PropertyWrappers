//
//  State.swift
//  PropertyWrappers
//
//  Created by Артём Скрипкин on 29.01.2023.
//

import SwiftUI

struct StateWrapper: View {

    @State var buttonTitle = "Title №1"

    var body: some View {
        Button(buttonTitle) {
            buttonTitle = "Title №\(Int.random(in: 0...10))"
        }
    }
}
