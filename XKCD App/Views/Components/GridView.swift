//
//  GridView.swift
//  XKCD App
//
//  Created by Tery Vezzuto on 27/07/22.
//

import SwiftUI

struct GridView: View {
    @State var allComics: [AllComics]
    @StateObject var favorites = FavoriteViewModel()
    @EnvironmentObject var cvm: ComicsViewModel
    var imageURL = ""

    init(_ comic: [AllComics]) {

        self.allComics = comic

    }

    let columns = [
        GridItem(.fixed(120)),
        GridItem(.fixed(120)),
        GridItem(.fixed(120))
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {

                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(allComics.reversed(), id: \.self) { singleComic in
                        NavigationLink(destination: ComicDetailsView(comicNumber: singleComic.id)) {

                            AsyncImage(url: URL(string: singleComic.imgs[0].sourceUrl)) { image in
                                    image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .scaledToFit()
                                    .clipped()
                                    .overlay(alignment: .topLeading) {
                                        Text("\(singleComic.id)")
                                            .font(.footnote)
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 5)
                                            .background(Color.gray.opacity(0.8))
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .padding()

                                    }
//                                if favorites.contains(comicNumber: comic.num) {
//                                    Spacer()
//                                   Image(systemName: "heart.fill")
//                                        .foregroundColor(.red)
//                                }
                                } placeholder: {
                                    ProgressView()
                                    .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/4)
                                }
                        }
                    }.task {
                            await loadComics()
                        }
                }
        }.environmentObject(favorites)

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

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView([.example])
    }
}
