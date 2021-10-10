//
//  SearchResultCellViewModel.swift
//  PhotoClient-SwiftUI
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import Foundation
import UIKit
import PhotoClientModels

public protocol SearchResultCellViewModelProtocol {
    var imageWidth: UInt { get }
    var imageHeight: UInt { get }
    var previewURL: String { get }
    var tags: String { get }
}

public final class SearchResultCellViewModel: SearchResultCellViewModelProtocol, Identifiable {
    public var imageWidth: UInt
    public var imageHeight: UInt
    public var previewURL: String
    public var imageURL: String
    public var tags: String

    public init(imageEntity: ImageEntity) {
        self.imageWidth = imageEntity.imageWidth
        self.imageHeight = imageEntity.imageHeight
        self.previewURL = imageEntity.previewURL
        self.imageURL = imageEntity.imageURL
        self.tags = imageEntity.tags
    }
}
