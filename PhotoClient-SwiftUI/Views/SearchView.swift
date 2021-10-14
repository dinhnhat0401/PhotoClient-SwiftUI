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
                    toggle
                    if showGrid {
                        searchResultGrid
                    } else {
                        searchResults
                    }
                }
            }
        }
    }

    // MARK: - private variables

    @ObservedObject private var viewModel: SearchViewModel
    @State var showGrid = false
}

extension SearchView {
    var searchField: some View {
        HStack(alignment: .center) {
        TextField("e.g. Cool girl", text: $viewModel.keyword)
        }
    }

    var toggle: some View {
        Toggle("Show Grid", isOn: $showGrid.animation(.none)).toggleStyle(.switch)
    }

    var searchResults: some View {
        Section {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.datasource) { searchResultCellViewModel in
                        NavigationLink(destination: ImageDetailsView(viewModel: searchResultCellViewModel)) {
                            SearchResultCell(viewModel: searchResultCellViewModel)
                                .frame(height: 100.0)
                                .onAppear {
                                guard let lastId = viewModel.datasource.last?.id else {
                                    return
                                }
                                if lastId == searchResultCellViewModel.id {
                                    self.viewModel.loadMore()
                                }
                            }
                        }
                    }
                }
            }.frame(height: 300)
        }
    }

    var searchResultGrid: some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        return Section {
            GeometryReader { geometry in
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.datasource) { searchResultCellViewModel in
                            NavigationLink(destination: ImageDetailsView(viewModel: searchResultCellViewModel)) {
                                SearchResultCell(viewModel: searchResultCellViewModel).frame(width: (geometry.size.width - 50) / 2.0, height: 100, alignment: .center)
                            }
                        }
                    }
                }
            }.frame(height: 400)
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
