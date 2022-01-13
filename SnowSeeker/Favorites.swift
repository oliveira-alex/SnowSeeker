//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Alex Oliveira on 12/01/2022.
//

import SwiftUI

class Favorites: ObservableObject {
    private var resorts: Set<String>
    
    private let saveKey = "Favorites"
    
    init() {
        if let favoriteData = UserDefaults.standard.data(forKey: saveKey) {
            if let favoriteResorts = try? JSONDecoder().decode(Set<String>.self, from: favoriteData) {
                resorts = favoriteResorts
                return
            }
        }
        
        resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        if let favoritesData = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(favoritesData, forKey: saveKey)
        }
    }
}
