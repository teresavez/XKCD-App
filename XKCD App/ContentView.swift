//
//  ContentView.swift
//  XKCD App
//
//  Created by Tery Vezzuto on 27/07/22.
//

import SwiftUI

struct ContentView: View {

    @State  var tabSelection = 0
    @State var number: Int = 0

    var body: some View {
        NavigationView {

            TabView(selection: $tabSelection) {

                HomeView(viewModel: ComicsViewModel())

        .tabItem {
            Label("", systemImage: "book")

        }.tag(0)

                FavoritesView(allComics: [.example])

                .tabItem {
                    Label("", systemImage: "heart")
                }.tag(1)
            }.accentColor(.white)
                .navigationTitle(tabSelection == 0 ? "XKCD Comics" : "Favorites")
        }.accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
