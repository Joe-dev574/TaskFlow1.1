//
//  Item.swift
//  TaskFlow1.1
//
//  Created by Joseph DeWeese on 2/10/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
