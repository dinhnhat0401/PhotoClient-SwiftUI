//
//  ResponseEntity.swift
//  PhotoClient-SwiftUI
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import Foundation

public struct ResponseEntity: Decodable {
    public let totalCount: Int64
    public let images: [ImageEntity]
}
