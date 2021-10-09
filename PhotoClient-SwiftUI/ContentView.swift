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
//        Text("Hello, world!")
//            .padding()
        SearchView(viewModel: searchViewModel)
    }
}

let searchViewModel = SearchViewModel(SearchImageService())

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}