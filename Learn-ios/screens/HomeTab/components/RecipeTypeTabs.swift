//
//  RecipeTypeTabs.swift
//  Learn-ios
//
//  Created by APPLE on 25/10/25.
//

import SwiftUI

struct RecipeTypeTabs: View {
    private let tabs = ["All", "Indian", "Chinese", "Italian", "American", "Asian"]
    @Binding var selectedTab: String
    func onTabSelected(tab: String) {
        selectedTab = tab
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tabs, id: \.self) { tab in
                        let isSelected = selectedTab == tab
                        Button(action: {
                            onTabSelected(tab: tab)
                            proxy.scrollTo(tab, anchor: .center)
                        }) {
                            Text(tab)
                                .font(.headline)
                                .foregroundColor(isSelected ? .white : colors.primary)
                                .padding(.horizontal, isSelected ? 24 : 16)
                                .padding(.vertical, 8)
                                .background(isSelected ? colors.primary : .white)
                                .cornerRadius(8)
                        }
                    }
                }
                
            }
            .padding(.horizontal, -16)
            .padding(.top, 16)
        }
    }
}
