//
//  ContentView.swift
//  VocabularioMaestro
//
//  Created by Sasha Walkowski on 1/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Vocabulario Maestro")
                NavigationLink("Start Learning") {
                    VocabularyInputView()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
