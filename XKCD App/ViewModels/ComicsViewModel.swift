//
//  ComicsViewModel.swift
//  XKCD App
//
//  Created by Tery Vezzuto on 27/07/22.
//

import Foundation
import SwiftUI

class ComicViewModel: ObservableObject {
    
    @Published private var comics = [AllComics]()
    @AppStorage("totalComics") private(set) var comicCount = 2650
    lazy var totalComics = (1..<self.comicCount)
      

    @MainActor//    to let stuff run on the main thread, not in the background's one
    public func loadComics() async {
        guard let url = URL(string: "https://api.xkcdy.com/comics") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try JSONDecoder().decode([AllComics]?.self, from: data) {
                
                DispatchQueue.main.async { [weak self] in
                    
                    self?.comics = decodedResponse
                    self?.comicCount = self!.comics.count + 1
                    
                }
            }
        }
        catch {
            print(error)
        }
        
    }
    
}
