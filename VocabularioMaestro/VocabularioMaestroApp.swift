//
//  VocabularioMaestroApp.swift
//  VocabularioMaestro
//
//  Created by Sasha Walkowski on 1/4/24.
//

import SwiftData
import SwiftUI

@main
struct VocabularioMaestroApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Definition.self)
    }
}
