//
//  EditDefinitionView.swift
//  VocabularioMaestro
//
//  Created by Sasha Walkowski on 1/5/24.
//

import SwiftData
import SwiftUI

struct EditDefinitionView: View {
    @Bindable var definition: Definition
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button { dismiss() } label: {
                    Image(systemName: "multiply")
                }
                .foregroundStyle(.black)
                .padding()

            }
            NavigationStack {
                    Form {
                        TextField("English", text: $definition.englishFlagImage)
                        TextField("Español", text: $definition.spanishFlagImage)
                    }
                    Form {
                        TextField("English", text: $definition.englishTerm)
                        TextField("Español", text: $definition.spanishTerm)
                    }

                Button("Add term/agregar término") {
                    withAnimation {
                        context.insert(definition)
                    }
                    dismiss()
                }
                .padding()
                .background {
                    Color("RosyBrown")
                }
                .foregroundStyle(.white)
                .clipShape(.buttonBorder)
                .disabled(definition.englishTerm.isEmpty && definition.spanishTerm.isEmpty)
            }

        }
    }
}
