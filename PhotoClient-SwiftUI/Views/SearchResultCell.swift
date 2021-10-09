//
//  SearchResultCell.swift
//  PhotoClient-SwiftUI
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import Foundation
import SwiftUI
import PhotoClientViewModels

public struct SearchResultCell: View {

    public init(viewModel: SearchResultCellViewModelProtocol) {
        self.viewModel = viewModel
    }

    public var body: some View {
        HStack {
            VStack {
                Text("\(viewModel.tags)")
                Text("\(viewModel.imageWidth) x \(viewModel.imageHeight)")
            }
        }
    }

    // MARK: - private variables

    private let viewModel: SearchResultCellViewModelProtocol
}
