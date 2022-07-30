//
//  HomeView.swift
//  XKCD App
//
//  Created by Tery Vezzuto on 27/07/22.
//

import SwiftUI

struct HomeView: View {

    let title = "More recent"
    var viewModel: ComicsViewModel

    var body: some View {
        ZStack {
            LinearGradient(colors: [.cyan, .indigo], startPoint: .top, endPoint: .bottomTrailing)
                        .ignoresSafeArea(.all)
            VStack(spacing: 8) {
            SearchBarView()
                    .padding(.horizontal, 8)
                    .padding(.vertical, 8)
            Text(title)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

                GridView([.example])
                    .frame(height: UIScreen.main.bounds.height/1.8)

        }.environmentObject(ComicsViewModel())

        }

    }

}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: ComicsViewModel())
    }
}
