//
//  AppStorage.swift
//  PropertyWrappers
//
//  Created by Артём Скрипкин on 29.01.2023.
//

import SwiftUI

struct AppStorageWrapper: View {

    @AppStorage("userName") var userName = ""

    var body: some View {
        VStack {
            Text("Your username: \(userName)")
            Button("update my name") {
                self.userName = "My new name number \(Int.random(in: 0...10))"
            }
        }
    }
}
