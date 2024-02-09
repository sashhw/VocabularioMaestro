//
//  VocabularyInputView.swift
//  VocabularioMaestro
//
//  Created by Sasha Walkowski on 1/4/24.
//

import SwiftData
import SwiftUI

struct VocabularyInputView: View {
    @Environment(\.modelContext) private var context
    @Query private var definitions: [Definition]
    @State private var path = [Definition]()
    //    @Query(sort: \.Definition.englishTerm) private var definitions: [Definition]
    @State private var isSheetPresented = false
    @State var selectedDefinition: Definition?

    @State private var englishTerm = ""
    @State private var spanishTerm = ""

    var body: some View {
        VStack {
            HStack {
                Text("Vocabulario")
                    .textCase(.uppercase)
                    .fontWeight(.semibold)
                    .font(.title2)
            }

            List {
                Text("English | Español")
                    .bold()
                ForEach(definitions) { definition in
                    HStack {
                        Text(definition.englishTerm)
                        Text(" | ")
                            .bold()
                        Text(definition.spanishTerm)
                        Spacer()
                        Button {
                            selectedDefinition = definition
                            isSheetPresented.toggle()
                        } label: {
                            Image(systemName: "pencil.line")
                        }
                    }
                    .sheet(item: $selectedDefinition, content: { definition in
                        EditDefinitionView(
                            definition: definition,
                            didTapDismiss: { isSheetPresented.toggle() },
                            didTapSave: { }
                        )
                    })
                }
                .onDelete(perform: { indices in
                    for index in indices {
                        deleteDefinition(definitions[index])
                    }
                })
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("", systemImage: "plus") {
                    let definition = Definition(englishTerm: "", spanishTerm: "", isCompleted: false)
                    context.insert(definition)
                    path = [definition]
                }
            }
        }
    }
//    func addDefinition() {
//        let definition = Definition(englishTerm: "Hi", spanishTerm: "Hola", isCompleted: false)
//        context.insert(definition)
//    }

    func deleteDefinition(_ definition: Definition) {
        context.delete(definition)
    }

//    func updateItem(_ definition: Definition) {
//        definition.englishTerm = "updated"
//        try? context.save()
//    }

//    func saveDefinition() {
//        let newDefinition = Definition(englishTerm: englishTerm, spanishTerm: spanishTerm)
//        context.insert(newDefinition)
//    }

    func dismiss() {

    }
}

#Preview {
    VocabularyInputView()
}
