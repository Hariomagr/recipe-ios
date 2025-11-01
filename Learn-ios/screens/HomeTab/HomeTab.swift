//
//  HomeTab.swift
//  Learn-ios
//
//  Created by APPLE on 25/10/25.
//

import SwiftUI
import BottomSheet
import SwiftUIFlowLayout

struct HomeTab: View {
    @StateObject var homeScreenViewModel = HomeScreenViewModel()

    @State var bottomSheetPosition: BottomSheetPosition = .hidden
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var selectedFilters: [String: String] = [:]
    
    private func fetch() {
        Task {
            await homeScreenViewModel.fetchData()
        }
    }
    
    var recipeCards: [RecipeCard] {
        (homeScreenViewModel.recipes ?? []).enumerated().map { index, recipe in
            RecipeCard(recipe: recipe, index: index)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Header(bottomSheetPosition: $bottomSheetPosition)
            RecipeTypeTabs(selectedTab: $homeScreenViewModel.category)
            ScrollView {
                if homeScreenViewModel.recipes == nil && homeScreenViewModel.isLoading {
                    ProgressView()
                } else {
                    LazyVGrid(columns: columns, spacing: 24) {
                        ForEach(recipeCards.indices, id: \.self) {
                            index in
                            recipeCards[index]
                                .onAppear {
                                    if index == recipeCards.count - 1 && homeScreenViewModel.hasMore {
                                        fetch()
                                    }
                                }
                        }
                    }
                    if (homeScreenViewModel.isLoading) {
                        ProgressView()
                    }
                }
                Spacer()
            }
            .scrollIndicators(.hidden)
            .padding(.top, 24)
            .refreshable {
                fetch()
            }
        }
        .opacity(bottomSheetPosition == .hidden ? 1 : 0.4)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        .bottomSheet(bottomSheetPosition: $bottomSheetPosition, switchablePositions: [.dynamic]) {
            VStack {
                Text("Filter Search")
                    .font(.headline)
                
                ModalFilters(selectedFilters: $selectedFilters)
                
                CtaButton(isFullWidth: true, onClick: {
                    
                }, label: "Apply", hasIcon: false)
                .padding(.horizontal, 48)
                .padding(.vertical, 16)
                
            }
            .padding(.bottom, 96)
            .padding(.top, 12)
        }
        .customBackground(Color.white.cornerRadius(30))
        .showDragIndicator(true)
        .enableTapToDismiss()
        .enableSwipeToDismiss()
        .onAppear {
            fetch()
        }
    }
}

struct FilterGroup {
    let label: String
    let filters: [String]
}

struct ModalFilters: View {
    @Binding var selectedFilters: [String: String]
    
    var filterData: [FilterGroup] = [
        FilterGroup(label: "Time", filters: ["All", "Newest", "Oldest", "Popularity"]),
        FilterGroup(label: "Rate", filters: ["5★", "4★", "3★", "2★", "1★"]),
        FilterGroup(label: "Category", filters: ["All", "Cereal", "Vegetables", "Dinner", "Chinese", "Local dish", "Breakfast", "Fruit"]),
    ]
    
    var body: some View {
        VStack {
            ForEach(filterData, id: \.label) { data in
                ModalTab(
                    label: data.label,
                    filters: data.filters,
                    selectedFilter: $selectedFilters[data.label]
                )
            }
        }
    }
}


struct ModalTabItem: View {
    var label: String
    @Binding var selectedFilter: String?
    
    var isSelected: Bool {
        label == selectedFilter
    }
    
    var body: some View {
        Button(action: {
            if (selectedFilter != label) {
                selectedFilter = label
            } else {
                selectedFilter = nil
            }
        }) {
            Text(label)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .foregroundColor(isSelected ? Color.white : colors.primary)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isSelected ? colors.primary : Color.white)
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(colors.primary, lineWidth: 1)
                }
        }
    }
}

struct ModalTab: View {
    var label: String
    var filters: [String]
    @Binding var selectedFilter: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            
            FlowLayout(
                mode: .scrollable,
                items: filters,
                itemSpacing: 4) {
                    ModalTabItem(label: $0, selectedFilter: $selectedFilter)
                }
            }
        .padding(.top, 12)
        .padding(.horizontal, 24)
        
    }
}
