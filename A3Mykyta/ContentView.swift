//
//  ContentView.swift
//  A3Mykyta
//
//  Created by Mykyta Kaisenberg on 2025-04-01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Mykyta Varnikov").bold()
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, word!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
