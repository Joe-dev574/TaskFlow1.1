//
//  Item.swift
//  TaskFlow1.1
//
//  Created by Joseph DeWeese on 2/10/25.
//

import SwiftUI
import SwiftData

@Model
final class Item {
    /// Properties
    var title: String
    var remarks: String
    var dateAdded: Date
    var dateStarted: Date = Date.distantPast
    var dateDue: Date = Date.distantFuture
    var dateCompleted: Date = Date.distantPast
    var itemCategory: String
    var status: Status.RawValue = Status.Upcoming.rawValue
    var itemColor: String
       @Relationship(deleteRule: .cascade)
    var updates: [Update]?
       @Relationship(inverse: \Tag.items)
        var tags: [Tag]?
    @Relationship(deleteRule: .cascade)
    var objectiveTasks: [ItemTask]?
    
    init(
        title: String = "",
        remarks: String = "",
        dateAdded: Date = Date.now,
        dateDue: Date = Date.distantFuture,
        dateStarted: Date = Date.distantPast,
        dateCompleted: Date = Date.distantPast,
        itemCategory: ItemCategory,
        status: Status = .Upcoming,
        itemColor: ItemColor,
        tags: [Tag]? = nil
    ) {
        self.title = title
        self.remarks = remarks
        self.dateAdded = dateAdded
        self.dateDue = dateDue
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.itemCategory = itemCategory.rawValue
        self.status = status.rawValue
        self.itemColor = itemColor.color
        self.tags = tags
    }
    var icon: Image {
        switch Status(rawValue: status)! {
        case .Upcoming:
            Image(systemName: "checkmark.diamond.fill")
        case .Active:
            Image(systemName: "item.fill")
        case .Completed:
            Image(systemName: "books.vertical.fill")
        }
    }
    /// Extracting Color Value from tintColor String
    @Transient
    var color: Color {
        return tints.first(where: { $0.color == itemColor })?.value ?? Constants.shared.itemColor
    }
    @Transient
    var tint: ItemColor? {
        return tints.first(where: { $0.color == itemColor })
    }
    @Transient
    var rawCategory: ItemCategory? {
        return ItemCategory.allCases.first(where: { itemCategory == $0.rawValue })
    }
}
    enum Status: Int, Codable, Identifiable, CaseIterable {
        case Upcoming, Active, Completed
        var id: Self {
            self
        }
        var descr: LocalizedStringResource {
            switch self {
            case .Upcoming:
                "Upcoming"
            case .Active:
                "Active"
            case .Completed:
                "Completed"
            }
        }
    }

