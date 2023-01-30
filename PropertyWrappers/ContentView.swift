//
//  ContentView.swift
//  PropertyWrappers
//
//  Created by Артём Скрипкин on 29.01.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            StateWrapper()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
