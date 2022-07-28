//
//  HomeView.swift
//  XKCD App
//
//  Created by Tery Vezzuto on 27/07/22.
//

import SwiftUI

struct HomeView: View {

    let title1 = "More recent"
    let title2 = "Suggested"
    var viewModel: ComicsViewModel

    var body: some View {
        ZStack {
            LinearGradient(colors: [.cyan, .indigo], startPoint: .top, endPoint: .bottomTrailing)
                        .ignoresSafeArea(.all)
        VStack {

            Text(title1)
                .font(.title2)
                .bold()
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                GridView([.example])

        }.environmentObject(ComicsViewModel())

        }

    }

}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: ComicsViewModel())
    }
}
