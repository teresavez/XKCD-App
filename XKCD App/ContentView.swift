//
//  ContentView.swift
//  XKCD App
//
//  Created by Tery Vezzuto on 27/07/22.
//

import SwiftUI

struct ContentView: View {

    @State private var searchText = ""
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

        FavoritesView()
                .tabItem {
                    Label("", systemImage: "heart").foregroundColor(.white)
                }.tag(1)
            }
            .searchable(text: $searchText)

             Divider()

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
