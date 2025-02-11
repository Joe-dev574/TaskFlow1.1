//
//  Update.swift
//  TaskFlow1.1
//
//  Created by Joseph DeWeese on 2/11/25.
//

import Foundation
import SwiftData

@Model
class Update {
    var creationDate: Date = Date.now
    var text: String = ""
    var page: String? = ""
    
    init(text: String, page: String? = nil) {
        self.text = text
        self.page = page
    }
    
    var item: Item?
}


