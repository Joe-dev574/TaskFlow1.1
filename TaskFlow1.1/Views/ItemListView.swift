//
//  ItemListView.swift
//  TaskFlow1.1
//
//  Created by Joseph DeWeese on 2/11/25.
//

import SwiftUI

struct ItemListView: View {
    @Binding var activeTab: ItemCategory
    @Environment(\.colorScheme) private var scheme
    
    var body: some View {
        CustomTabBar(activeTab: $activeTab)
        LazyVStack(alignment: .leading) {
            Text(activeTab.rawValue + (activeTab == .dates ? " Thou Shalt Not Forget! " : " Shit"))
                .font(.title3)
                .fontDesign(.serif)
                .foregroundStyle(.gray)
                .padding(.leading, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
    
}
