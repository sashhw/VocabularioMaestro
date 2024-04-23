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
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .shadow(radius: 5)
                    .padding(.bottom, 50)

                NavigationLink {
                    VocabularyInputView()
                } label: {
                    Text("Start Learning")
                        .foregroundStyle(.coralPink)
                        .fontWeight(.semibold)
                }
                .padding()
                .background(.white)
                .clipShape(.buttonBorder)
                .shadow(radius: 5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background{
                Color(.deepPurple)
                    .ignoresSafeArea()
                    .opacity(0.7)
            }
        }
    }
}

#Preview {
    ContentView()
}
