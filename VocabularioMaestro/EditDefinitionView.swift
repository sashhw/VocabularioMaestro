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
//    @State private var englishTerm = ""
//    @State private var spanishTerm = ""
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    let didTapDismiss: () -> Void
    let didTapSave: () -> Void

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button { didTapDismiss() } label: {
                    Image(systemName: "multiply")
                }
                .foregroundStyle(.black)
                .padding()

            }
            NavigationStack {
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
                .disabled(definition.englishTerm.isEmpty && definition.spanishTerm.isEmpty)
            }

        }
    }
//    func save() {
//        let newDefinition = Definition(englishTerm: englishTerm, spanishTerm: spanishTerm)
//        context.insert(newDefinition)
//    }
}

//#Preview {
//    EditDefinitionView(
//        definition: .init(
//            englishTerm: "hello",
//            spanishTerm: "hola",
//            isCompleted: false
//        ),
//        didTapDismiss: {},
//        didTapSave: {}
//    )
//}
