//
//  ImageDetailsView.swift
//  PhotoClientViews
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import Foundation
import NukeUI
import SwiftUI
import PhotoClientViewModels
import PhotoClientModels

public struct ImageDetailsView: View {

    init(viewModel: SearchResultCellViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack {
            userView
            Spacer()
            GeometryReader { geometry in
                LazyImage(source: viewModel.imageURL)
                    .frame(width: geometry.size.width, height: geometry.size.height - 150.0, alignment: .center)
                    .aspectRatio(1.0, contentMode: .fit)
            }
            Spacer()
            infoView
        }
    }

    private var viewModel: SearchResultCellViewModel
}

extension ImageDetailsView {
    var userView: some View {
        HStack {
//            Image(UIImage(named: "")!)
            Text("Watashidayo")
        }
    }

    var infoView: some View {
        HStack {
            Text(self.viewModel.tags)
        }
    }
}
