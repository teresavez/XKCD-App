//
//  FavoritesView.swift
//  XKCD App
//
//  Created by Tery Vezzuto on 27/07/22.
//

import SwiftUI

struct FavoritesView: View {

    @State var allComics: [AllComics]
    @StateObject var favorites = FavoriteViewModel()

    var body: some View {
        ZStack {
            LinearGradient(colors: [.cyan, .indigo], startPoint: .top, endPoint: .bottomTrailing)
                        .ignoresSafeArea(.all)
        ScrollView {

            ForEach(allComics, id: \.id) { comic in
                    if favorites.contains(comicNumber: comic.id) {

                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                    .frame(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.height/5)
                    .foregroundColor(.white.opacity(0.9))
                    .overlay(alignment: .leading) {
                    HStack {
                        AsyncImage(url: URL(string: comic.imgs[0].sourceUrl)) { image in
                            image
                                .resizable()
                                .frame(width: 120, height: 120)
                                .scaledToFit()
                                .shadow(radius: 15)
                                .padding()

                        }
                    placeholder: {
                            ProgressView()
                            .frame(width: 120, height: 120)
                        }
                    VStack {
                        Text("\(comic.id)").bold()
                        Text(comic.title).bold()
                    }.font(.title3)
                        Spacer()
                    }
                    }
                }
                }
                }
        }.environmentObject(favorites)
            .task {
                await loadComics()
            }
        }.navigationTitle("ciao")
    }

    public func loadComics() async {

        guard let url = URL(string: "https://api.xkcdy.com/comics") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try JSONDecoder().decode([AllComics]?.self, from: data) {

                self.allComics = decodedResponse
           }
        } catch {
            print(error)
        }

    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(allComics: [.example])
            .environmentObject(FavoriteViewModel())
    }
}
