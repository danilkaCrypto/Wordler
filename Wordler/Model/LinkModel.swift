//
//  LinkItem.swift
//  Wordler
//
//  Created by danilka on 18.06.2023.
//

import Foundation
import RealmSwift

class LinkModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String = ""
    @Persisted var url: String = ""
    
    
    override class func primaryKey() -> String? {
        "id"
    }
}
