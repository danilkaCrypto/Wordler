//
//  CategoryItem.swift
//  Wordler
//
//  Created by danilka on 19.06.2023.
//

import Foundation
import RealmSwift

class CategoryItem: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String = ""
    
    
    override class func primaryKey() -> String? {
        "id"
    }
}
