//
//  WordItem.swift
//  Wordler
//
//  Created by danilka on 18.06.2023.
//

import Foundation
import Realm
import RealmSwift

class WordItem: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var location: String = "🇺🇸"
    @Persisted var mainWord: String = ""
    @Persisted var wordTranslate: String = ""
    @Persisted var wordNote: String = ""
    @Persisted var category: String = ""
    
    @Persisted var weight: Int = 0
    
    override class func primaryKey() -> String? {
        "id"
    }
    
}



