//
//  DefinitionModel.swift
//  VocabularioMaestro
//
//  Created by Sasha Walkowski on 1/4/24.
//

import Foundation
import SwiftData

@Model
final class Definition: Identifiable {
    @Attribute(.unique) var id: String
    var englishTerm: String
    var spanishTerm: String
    var isCompleted: Bool
    var englishFlagImage: String
    var spanishFlagImage: String


    init(
        englishTerm: String = "",
        spanishTerm: String = "",
        isCompleted: Bool = false,
        englishFlagImage: String = "",
        spanishFlagImage: String = ""
    ) {
        self.id = UUID().uuidString
        self.englishTerm = englishTerm
        self.spanishTerm = spanishTerm
        self.isCompleted = isCompleted
        self.englishFlagImage = englishFlagImage
        self.spanishFlagImage = spanishFlagImage
    }
}

//extension Definition {
//    static var dummy: Definition {
//        .init(
//            englishTerm: "hello",
//            spanishTerm: "hola",
//            isCompleted: false
//        )
//    }
//}
