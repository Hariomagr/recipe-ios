//
//  localStorage.swift
//  Learn-ios
//
//  Created by APPLE on 02/11/25.
//
import Foundation
import SwiftUI

class FavoritesManager: ObservableObject {
    @Published private(set) var favorites: [Int] = []

    private let key = "favs"
    private let defaults = UserDefaults.standard

    init() {
        favorites = defaults.array(forKey: key) as? [Int] ?? []
    }

    func isFavorite(id: Int) -> Bool {
        favorites.contains(id)
    }

    private func addToFavs(id: Int) {
        guard !favorites.contains(id) else { return }
        favorites.append(id)
        save()
    }

    private func removeFromFavs(id: Int) {
        favorites.removeAll { $0 == id }
        save()
    }
    
    func toggleFavorite(id: Int) {
        isFavorite(id: id) ? removeFromFavs(id: id) : addToFavs(id: id)
    }

    private func save() {
        defaults.set(favorites, forKey: key)
    }
}
