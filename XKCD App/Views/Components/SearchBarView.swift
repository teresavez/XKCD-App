//
//  SearchBarView.swift
//  XKCD App
//
//  Created by Tery Vezzuto on 30/07/22.
//

import SwiftUI

struct SearchBarView: View {

    @State private var searchComic = ""

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)

            TextField("Search...", text: $searchComic)
                .font(.callout)
                .foregroundColor(.secondary)

            if !searchComic.isEmpty {
                Button(action: refreshSearch ) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                }
            }
                }.padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.white.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 14))
    }

    func refreshSearch() {
        searchComic = ""
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
