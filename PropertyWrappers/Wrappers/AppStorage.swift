//
//  AppStorage.swift
//  PropertyWrappers
//
//  Created by Артём Скрипкин on 29.01.2023.
//

import SwiftUI

struct AppStorageWrapper: WrapperView {

    @AppStorage("userName") var userName = ""

    var body: some View {
        VStack {
            Text("Your username: \(userName)")
            Button("update my name") {
                self.userName = "My new name"
            }
        }
    }
}
