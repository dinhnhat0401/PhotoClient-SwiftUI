//
//  ResponseEntity.swift
//  PhotoClient-SwiftUI
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import Foundation

public struct ResponseEntity: Decodable {
    public let total: UInt
    public let totalHits: UInt
    public let hits: [ImageEntity]

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case hits = "hits"

        case totalHits = "totalHits"
    }
}
