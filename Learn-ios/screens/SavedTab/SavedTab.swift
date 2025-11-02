//
//  SavedTab.swift
//  Learn-ios
//
//  Created by APPLE on 02/11/25.
//
import SwiftUI
import Foundation

struct SavedTab: View {
    
    @EnvironmentObject var coreDataView: CoreStorageDataViewModel
    var recipes: [String] {
        coreDataView.recipes
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(recipes, id: \.self) { recipe in
                    Text(recipe)
                }
            }
        }
    }
}
