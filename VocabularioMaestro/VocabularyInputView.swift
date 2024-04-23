import SwiftData
import SwiftUI

struct VocabularyInputView: View {
    @Environment(\.modelContext) private var context
    @Query private var definitions: [Definition]
    @State private var path = [Definition]()
    @State private var isSheetPresented = false
    @State var selectedDefinition: Definition?
    @State private var showAlert = false

    @State private var englishTerm = ""
    @State private var spanishTerm = ""
    @State private var englishFlagImage = ""
    @State private var spanishFlagImage = ""

    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(.rainCloudGray)
                        .opacity(0.1)
                        .shadow(radius: 5)
                        .frame(maxWidth: .infinity)

                    Text("Vocabulario")
                        .textCase(.uppercase)
                        .fontWeight(.semibold)
                        .font(.title)
                        .foregroundStyle(.rainCloudGray)
                        .shadow(radius: 0.5)
                        .padding(.vertical, 16)
                }
                .padding(.horizontal, 48)

                VStack(alignment: .leading, spacing: 8) {
                    Text("English")
                        .foregroundStyle(.rosyBrown)
                        .shadow(radius: 0.5)

                    Text("Español")
                        .foregroundStyle(Color(.deepPurple))
                        .shadow(radius: 0.5)
                }
                .bold()
                .padding(.vertical, 16)

                ForEach(definitions) { definition in
                    ZStack {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(.rainCloudGray)
                            .opacity(0.1)
                            .shadow(radius: 5)
                            .frame(maxWidth: .infinity)

                        HStack {
                            Text(definition.englishTerm )
                            Text(definition.spanishTerm)
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                                        .fill(.rosyBrown)
                                        .opacity(0.5)
                                        .shadow(radius: 5)
                                        .frame(maxWidth: .infinity)

                                    Text(definition.englishTerm)
                                        .foregroundStyle(.black)
                                        .shadow(radius: 0.5)
                                        .padding(.vertical, 10)
                                }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                                        .fill(.deepPurple)
                                        .opacity(0.5)
                                        .shadow(radius: 5)
                                        .frame(maxWidth: .infinity)
                                    Text(definition.spanishTerm)
                                        .foregroundStyle(.black)
                                        .shadow(radius: 0.5)
                                        .padding(.vertical, 10)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(16)

                            Spacer()
                            VStack {
                                Button(action: {
                                    showAlert.toggle()
                                    selectedDefinition = definition
                                }) {
                                    ZStack {
                                        Circle()
                                            .fill(Color.gray)
                                            .frame(width: 20, height: 20)
                                        Image(systemName: "xmark")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(.white)
                                            .frame(width: 10, height: 10)
                                    }
                                    .padding(.all, 6)
                                }

                                Spacer()

                                Button {
                                    selectedDefinition = definition
                                    isSheetPresented.toggle()
                                } label: {
                                    Image(systemName: "pencil.line")
                                        .foregroundStyle(.rainCloudGray)
                                        .padding(.trailing, 8)
                                        .padding(.bottom, 16)
                                }
                            }

                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 16, trailing: 10))
                    .padding(.horizontal, 20)
                    .onTapGesture {
                        selectedDefinition = definition
                        isSheetPresented.toggle()
                    }
                    .sheet(item: $selectedDefinition, content: { definition in
                        EditDefinitionView(
                            definition: definition
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
                    let definition = Definition(
                        englishTerm: "Hola",
                        spanishTerm: "Adios",
                        isCompleted: false,
                        englishFlagImage: "🇺🇸",
                        spanishFlagImage: "🇪🇸"
                    )
                    context.insert(definition)
                    path = [definition]
                }
                .foregroundStyle(.rainCloudGray)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("WAIT"),
                message: Text("Are you sure you want to delete this term?"),
                primaryButton: .destructive(Text("Delete")) {
                    if let selectedDefinition = selectedDefinition {
                        deleteDefinition(selectedDefinition)
                    }
                },
                secondaryButton: .cancel()
            )
        }
    }

    func deleteDefinition(_ definition: Definition) {
        context.delete(definition)
    }
}

#Preview {
    VocabularyInputView()
}
