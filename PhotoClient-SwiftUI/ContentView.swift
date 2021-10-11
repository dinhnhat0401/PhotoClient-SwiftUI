//
//  ContentView.swift
//  PhotoClient-SwiftUI
//
//  Created by Đinh Văn Nhật on 2021/10/07.
//

import SwiftUI
import PhotoClientModels
import PhotoClientViews
import PhotoClientViewModels

struct ContentView: View {
    var body: some View {
        NavigationView {
            SearchView(viewModel: searchViewModel)
                .navigationBarTitle("TOP")
        }
    }
}

let urlSession = URLSession.shared
let network = Network(urlSession)
let searchViewModel = SearchViewModel(SearchImageService(network))

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

        if #available(iOS 15.0, *) {
            ContentView()
                .previewInterfaceOrientation(.landscapeLeft)
        } else {
            // Fallback on earlier versions
        }
    }
}
