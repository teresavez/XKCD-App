//
//  ComicDetailsView.swift
//  XKCD App
//
//  Created by Tery Vezzuto on 27/07/22.
//

import SwiftUI

struct ComicDetailsView: View {
    @State var comic: Comic = .example
    @StateObject var favorites = FavoriteViewModel()
    let comicNumber: Int

    init(comicNumber: Int) {
        self.comicNumber = comicNumber
    }

    var body: some View {
        ZStack {
            LinearGradient(colors: [.cyan, .indigo], startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)

            VStack {

            ScrollView(showsIndicators: false) {

                HStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 50, height: 30)
                    .foregroundColor(.white).opacity(0.4)
                    .shadow(radius: 30)
                    .overlay {
                        Text("\(comic.num)")
                            .foregroundColor(.white)
                            .bold()
                    }.padding(4)
                    Spacer()
                }
                    AsyncImage(url: URL(string: comic.img)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .shadow(color: .indigo, radius: 10)
                    } placeholder: {
                        ProgressView()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2.5)
                    }

                    Spacer()
                    .frame(height: UIScreen.main.bounds.height/22)

                    HStack {
                                Text(comic.title)
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(.white)

                        Text("(\(comic.year))")
                            .font(.caption)
                        Spacer()

                        Button(action: {
                            if  favorites.contains(comicNumber: comic.num) {
                                favorites.delete(comicNumber: comic.num)
                            } else {
                                favorites.add(comicNumber: comic.num)
                            }
                        }, label: {
                            Image(systemName: favorites.contains(comicNumber: comic.num) ? "heart.fill" : "heart")
                                .foregroundColor(favorites.contains(comicNumber: comic.num) ? .red : .white)
                                .frame(width: UIScreen.main.bounds.width/12)
                        })
                    }.padding(4)

                    Text(comic.alt)
                        .font(.headline)
                        .foregroundColor(.white)

                    Spacer()

                    Text(comic.transcript)
                        .font(.headline)
            }
                .task {
                    await loadComic(comicNumber: comicNumber)
                }

            }
        }.environmentObject(favorites)
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: Image(systemName: "chevron.left"))
    }

    func loadComic(comicNumber: Int) async {
        guard let url = URL(string: "https://xkcd.com/\(comicNumber)/info.0.json") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try JSONDecoder().decode(Comic?.self, from: data) {

                self.comic = decodedResponse
            }
        } catch {
            print(error)
        }

    }
}

// struct ComicDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ComicDetailsView()
//    }
// }
