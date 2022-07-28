//
//  FavoriteViewModel.swift
//  XKCD App
//
//  Created by Tery Vezzuto on 28/07/22.
//

import Foundation
import SwiftUI

class FavoriteViewModel: ObservableObject {
    @Published var comicNumbers: Set<Int> = Set<Int>() {
    didSet {
        save()
    }
    }
    private var saveKey = "Favorite"

    init() {
        getFavoriteComic()
    }

    func getFavoriteComic() {
        guard
             let data = UserDefaults.standard.data(forKey: saveKey),
             let savedComics = try? JSONDecoder().decode(Set<Int>.self, from: data)
        else { return }
        self.comicNumbers = savedComics
    }

    func contains(comicNumber: Int) -> Bool {
        comicNumbers.contains(comicNumber)
    }

    func add(comicNumber: Int) {
        objectWillChange.send()
        comicNumbers.insert(comicNumber)
        save()
    }

    func delete(comicNumber: Int) {
        objectWillChange.send()
        comicNumbers.remove(comicNumber)
        save()
    }

    func save() {
        if let favComics = try? JSONEncoder().encode(comicNumbers) {
            UserDefaults.standard.set(favComics, forKey: saveKey)
        }
    }
}
