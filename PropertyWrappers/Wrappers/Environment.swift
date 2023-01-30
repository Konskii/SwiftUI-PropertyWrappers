//
//  Environment.swift
//  PropertyWrappers
//
//  Created by Артём Скрипкин on 29.01.2023.
//

import SwiftUI

struct EnvironmentWrapper: View {
    @Environment(\.colorScheme) var color

    var body: some View {
        Text(color == .dark ? "Dark" : "Light")
    }
}
