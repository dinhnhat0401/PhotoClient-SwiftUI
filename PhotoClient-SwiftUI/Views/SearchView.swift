//
//  SearchView.swift
//  PhotoClientViews
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import Foundation
import SwiftUI
import PhotoClientViewModels

public struct SearchView: View {
    public init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        NavigationView {
            List {
                searchField

                if $viewModel.datasource.isEmpty {
                    emptySection
                } else {
                    detailsView
                    searchResults
                }
            }
        }
    }

    // MARK: - private variables

    @ObservedObject private var viewModel: SearchViewModel
}

extension SearchView {
    var searchField: some View {
        HStack(alignment: .center) {
        TextField("e.g. Cool girl", text: $viewModel.keyword)
        }
    }

    var searchResults: some View {
        Section {
            ForEach(viewModel.datasource, content: SearchResultCell.init(viewModel:))
        }
    }

    var detailsView: some View {
        Section {
            VStack(alignment: .leading) {
              Text(viewModel.keyword)
              Text("More like this")
                .font(.caption)
                .foregroundColor(.gray)
            }
        }
    }

    var emptySection: some View {
      Section {
        Text("No results")
          .foregroundColor(.gray)
      }
    }
}
