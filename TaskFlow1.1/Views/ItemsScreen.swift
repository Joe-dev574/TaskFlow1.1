//
//  ItemsScreen.swift
//  TaskFlow1.1
//
//  Created by Joseph DeWeese on 2/11/25.
//

import SwiftUI

struct ItemsScreen: View {
    @State var activeTab: ItemCategory
    
    
    var body: some View {
        ItemListView(activeTab: $activeTab)
    }
}

#Preview {
    ItemsScreen(activeTab: .today)
}
