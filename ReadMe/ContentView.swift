//
//  ContentView.swift
//  ReadMe
//
//  Created by Artem Lyksa on 1/31/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image(systemName: "book")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .font(.title.weight(.light))
                .foregroundColor(.secondary.opacity(0.5))
            Text("Hello, world!")
                .font(.title2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
