//
//  ContentView.swift
//  TaskFlow1.1
//
//  Created by Joseph DeWeese on 2/10/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    
    var body: some View {
        ItemsScreen( activeTab: .today)
    }
}
#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
