//
//  ImageEntity.swift
//  PhotoClient-SwiftUI
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import Foundation

public struct ImageEntity: Decodable {
    public let id: UInt

//    public let pageURL: String
//    public let pageImageWidth: UInt
//    public let pageImageHeight: UInt
//
    public let previewURL: String
//    public let previewWidth: Int
//    public let previewHeight: Int

    public let imageURL: String
    public let imageWidth: UInt
    public let imageHeight: UInt

//    public let viewCount: Int64
//    public let downloadCount: Int64
//    public let likeCount: Int64
    public let tags: String
//    public let username: String

    public init(id: UInt, previewURL: String, imageURL: String, imageWidth: UInt, imageHeight: UInt, tags: String) {
        self.id = id
        self.previewURL = previewURL
        self.imageURL = imageURL
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.tags = tags
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case imageURL = "webformatURL"
        case previewURL = "previewURL"
        case imageWidth = "webformatWidth"
        case imageHeight = "webformatHeight"
        case tags = "tags"
    }
}
