//
//  WordlerApp.swift
//  Wordler
//
//  Created by danilka on 17.06.2023.
//

import SwiftUI
import RealmSwift

@main
struct WordlerApp: SwiftUI.App {
    
    init() {
        let config = Realm.Configuration(
            schemaVersion: 3)
        Realm.Configuration.defaultConfiguration = config
        let realm = try! Realm()
    }
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
    }
}
