//
//  SearchBarView.swift
//  XKCD App
//
//  Created by Tery Vezzuto on 30/07/22.
//

import SwiftUI

struct SearchBarView: View {

    @State private var searchText = ""

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)

            TextField("Search...", text: $searchText)
                .font(.callout)

                }.padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.white.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
