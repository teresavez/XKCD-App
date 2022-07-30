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
                .navigationTitle("XKCD Comics")

        .tabItem {
            Label("", systemImage: "book")

        }.tag(0)

                FavoritesView(allComics: [.example])
                    .navigationTitle("Favorites")
                .tabItem {
                    Label("", systemImage: "heart")
                }.tag(1)
            }.accentColor(.white)
                .onAppear(perform: {
                    UITabBar.appearance().barTintColor = .black
                })

        }
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
        .background(.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
